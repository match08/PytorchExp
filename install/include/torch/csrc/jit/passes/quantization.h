/** \brief This file defines passes used for quantization.
 *
 * The passes have python-bindings and can be invoked directly or as a part of
 * general optimization pipeline (details TBD).
 */
#pragma once

#include <torch/csrc/jit/ir.h>
#include <torch/csrc/jit/script/module.h>

namespace torch {
namespace jit {

using QConfig = std::tuple<script::Module, script::Module>;
using QConfigDict = std::unordered_map<std::string, QConfig>;
using ModuleQConfigMap = std::unordered_map<script::ModulePtr, c10::optional<QConfig>>;

/** \brief Propagates QParams through nodes that are not supposed to change it.
 *
 * An example of such node is `Split`: even though the observed distribution
 * might be different for input and output tensors, we would like to use input's
 * qparams for output as well.
 */
TORCH_API void PropagateQuantInfo(std::shared_ptr<Graph>& graph);

/** \brief Check that all expected optimizations after quant-dequant nodes
 * insertion actually happened.
 *
 * Even though semantically it would be correct to just execute the initial
 * quant-dequant nodes as is, what we really wanted when we inserted them is to
 * fuse them into adjacent non-quantized ops resulting in quantized ops. Thus,
 * if after all the cleanups, optimizations (particularly, fusion) we find
 * quant-dequant pair in the graph, it indicates that quantization didn't go as
 * planned.
 */
TORCH_API void QuantLinting(std::shared_ptr<Graph>& graph);

/** \brief Quantize model's inputs and outputs.
 *
 * This pass folds quant/dequant ops into the input/output tensors, essentially
 * quantizing these tensors. It's done to reduce model's memory footprint.
 */
TORCH_API void FoldQuantNodesIntoInputsOutputs(std::shared_ptr<Graph>& graph);

/** \brief Insert observer module and observer function call for
 *  the Tensors that needs to be observed.
 *
 * For each Tensor that needs to be observed in the method, insert observer
 * module to the input module and add forward calls of observer to the specified
 * method.
 *
 * \param module the input module
 * \param method_name the method we want to insert observers for
 * \param observer_module the default observer module
 * \param weight_observer_module the observer module that will be used
 * by weight
 */
TORCH_API void InsertObservers(
    script::Module& module,
    const std::string& method_name,
    const std::unordered_map<std::string,
    std::tuple<script::Module, script::Module>>& qconfig_dict);

/** \brief Insert quantize - int_repr - dequantize calls to the Tensors
 *  that are observed in insert_observers pass
 *
 * For each Tensor that is observed, get the observer module and call
 * calculate_qparam on the observer module to get quantization parameters
 * and add quantize - int_repr - dequantize function calls using these parameters
 * we also have special handling for quantizing "bias" right now.
 *
 * \param module the input module
 * \param method_name the method we want to insert quantization calls for
 */
TORCH_API script::Module InsertQuantDeQuant(
    script::Module& module,
    const std::string& method_name);

/** \brief Backend specific pass to fuse dequantize - op - quantize calls
 * as quantized_op calls.
 *
 * Right now this is a fusion for fbgemm backend and only works for quantized
 * conv op, we'll extend to more ops and more backends in the future.
 *
 * \param graph the graph we want to apply fusion
 */
TORCH_API void QuantFusion(std::shared_ptr<Graph>& graph);

/** \brief Fold Conv2d-BatchNorm2d into Conv2d in forward method of this module
 * and all its submodules.
 *
 * The weight and bias of the Conv2d are correspondingly updated. Should only be
 * used on modules in eval mode.
 */
TORCH_API void FoldConvBatchNorm2d(const script::Module& module);

} // namespace jit
} // namespace torch

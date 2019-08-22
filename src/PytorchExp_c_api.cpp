//
//  PytorchExp_c_api.cpp
//  Pods-Pytorch-Exp-Demo
//
//  Created by taox on 8/21/19.
//

#include <torch/script.h>
#include <memory>
#include "PytorchExp_c_api.h"
#include "PytorchExp_c_api_internal.h"


#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus
    TorchscriptModule* loadModel(const char* modelPath) {
        auto module = torch::jit::load(modelPath);
        std::shared_ptr<torch::jit::script::Module> shared_module = std::make_shared<torch::jit::script::Module>(module);
        return shared_module ? new TorchscriptModule{std::move(shared_module)} : nullptr;
    }
    
    void TorchscriptModuleDelete(TorchscriptModule* module){
        delete module;
    }
    
#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus

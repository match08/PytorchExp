//
//  PytorchExp_c_api_internal.h
//  Pods
//
//  Created by taox on 8/21/19.
//

#ifndef PytorchExp_c_api_internal_h
#define PytorchExp_c_api_internal_h

#include <memory>
#include <torch/script.h>

struct TorchscriptModule {
    // Sharing is safe as TorchscriptModule is const.
    std::shared_ptr<const torch::jit::script::Module> impl;
};



#endif /* PytorchExp_c_api_internal_h */

//
//  PytorchExp_c_api.hpp
//  Pods-Pytorch-Exp-Demo
//
//  Created by taox on 8/21/19.
//

#ifndef PytorchExp_c_api_h
#define PytorchExp_c_api_h

#include <stdarg.h>
#include <stdint.h>

#define PTM_CAPI_EXPORT __attribute__((visibility("default")))

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus
    typedef struct TorchscriptModule TorchscriptModule;
    
    TorchscriptModule* loadModel(const char* modelPath);
    
    void TorchscriptModuleDelete(TorchscriptModule* module);
    
#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus




#endif /* PytorchExp_c_api_hpp */

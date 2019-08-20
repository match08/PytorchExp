## Pytorch-Exp for iOS

Experimental Pytorch cocoapods for iOS.

> This is not the offical Pytorch iOS cocoapods. Please do not use it in production. 

### Installation

To try Pytorch-Exp, simply add the following code to your Podfile 

```
pod 'Pytorch-Exp'
```
and run `pod install`

### Note

For the demo purpose, the libtorch.a only supports one architecture - arm64, meaning the code can be only run on an arm64 device. And because of the size issues, the bitcode has been stripped out, so the bitcode switch in XCode should be turned off as well.

### Using Pytorch-Exp

Currently there is only one public interface - `Pytorch.h`. To load the TorchScript file, we can use:

```cpp
torch::jit::load ("path_to_model");
```
to run the inference, we can use the `forward` API and pass in the input tensor

```cpp
auto outputs= module.forward(inputs).toTensor();
```

### ToDo

- Add a C API wrapper for Objective-C and Swift
- Make a Swift demo
- Shrink the binary size

### License

Pytorch-Exp is available under the MIT License. See the LICENSE.md file for more info.
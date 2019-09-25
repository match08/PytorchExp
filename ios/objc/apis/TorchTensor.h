#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TorchTensorType) {
  TorchTensorTypeByte,       // 8bit unsigned integer
  TorchTensorTypeChar,       // 8bit signed integer
  TorchTensorTypeInt,        // 32bit signed integer
  TorchTensorTypeLong,       // 64bit signed integer
  TorchTensorTypeFloat,      // 32bit single precision floating point
  TorchTensorTypeUndefined,  // Undefined tensor type. This indicates an error with the model
};
/**
 An input or output tensor model
 */
@interface TorchTensor : NSObject <NSCopying>
/**
 Data type of the tensor
 */
@property(nonatomic, readonly) TorchTensorType dtype;
/**
//The size of the tensor. The returned value is a array of integer
 */
@property(nonatomic, readonly) NSArray<NSNumber*>* sizes;
/**
 /The number of dimensions of the tensor.
 */
@property(nonatomic, readonly) int64_t dim;
/**
 The total number of elements in the input tensor.
 */
@property(nonatomic, readonly) int64_t numel;
/**
 The raw buffer of tensor
 */
@property(nonatomic, readonly) void* data;
/**
 Creat a tensor object with data type, shape and a raw pointer to a data buffer.

 @param type Data type of the tensor
 @param size Size of the tensor
 @param data A raw pointer to a data buffer
 @return  A tensor object
 */
+ (nullable TorchTensor*)newWithData:(void*)data
                                Size:(NSArray<NSNumber*>*)size
                                Type:(TorchTensorType)type;

@end

NS_ASSUME_NONNULL_END

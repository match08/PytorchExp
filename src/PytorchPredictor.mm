//
//  Copyright © 2019年 Vizlab. All rights reserved.
//

#import "PytorchPredictor.h"
#import "torch/script.h"
#import <vector>

#define IMG_W 224
#define IMG_H 224
#define IMG_C 3

@implementation PytorchPredictor

+ (void)predict:(UIImage* )image
      withModel:(NSString* )path
     Completion:(void(^__nullable)(NSArray<NSNumber* >* scores, NSArray<NSNumber*>* index)) completion{
    
    auto module =  torch::jit::load([path cStringUsingEncoding:NSASCIIStringEncoding]);
    NSData* pixels = [image resize:{IMG_W,IMG_H}].rgb;
    at::Tensor img_tensor = torch::from_blob((void* )pixels.bytes, {1, IMG_W, IMG_H, IMG_C}, at::kByte);
    // pixel buffer is in WxHxC, make it CxWxH
    img_tensor = img_tensor.permute({0,3,1,2});
    img_tensor = img_tensor.toType(at::kFloat);
    img_tensor.div_(255);
    // normalize the input tensor
    img_tensor[0][0].sub_(0.485).div_(0.229);
    img_tensor[0][1].sub_(0.456).div_(0.224);
    img_tensor[0][2].sub_(0.406).div_(0.225);

    std::vector<torch::jit::IValue> inputs{img_tensor};
    auto outputs= module.forward(inputs).toTensor();
    auto result = outputs.topk(10, -1);
    //flat socres and indexes
    auto scores = std::get<0>(result).view(-1);
    auto idxs = std::get<1>(result).view(-1);
    NSMutableArray* topScores = [NSMutableArray new];
    NSMutableArray* topIndexes = [NSMutableArray new];
    //collect top 10 results
    for (int i = 0; i < 10; ++i) {
        [topScores addObject:@(scores[i].item().toFloat())];
        [topIndexes addObject:@(idxs[i].item().toInt())];
    }
    if(completion){
        completion(topScores.copy, topIndexes.copy);
    }
}

@end

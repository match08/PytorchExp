//
//  Copyright © 2019年 Vizlab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagePredictor : NSObject

+ (void)predict:(UIImage* )image
      withModel:(NSString* )path
     Completion:(void(^__nullable)(NSArray<NSNumber* >* scores,
                                   NSArray<NSNumber*>* index)) completion;

@end

NS_ASSUME_NONNULL_END

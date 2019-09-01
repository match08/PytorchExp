//
//  ViewController.m
//  TestApp
//
//  Created by taox on 8/25/19.
//  Copyright © 2019 taox. All rights reserved.
//

#import "ViewController.h"
#import "ImagePredictor.h"

@interface ViewController (){
    ImagePredictor* _predictor;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _predictor = [[ImagePredictor alloc]initWithModelPath:[[NSBundle mainBundle] pathForResource:@"resnet18" ofType:@"pt"]];
    UIImage* image = [UIImage imageNamed:@"wolf_400x400.jpg"];
    [_predictor predict:image Completion:^(NSArray<NSDictionary *> * _Nonnull sortedResults) {
        NSLog(@"%@",sortedResults);
    }];
}

@end

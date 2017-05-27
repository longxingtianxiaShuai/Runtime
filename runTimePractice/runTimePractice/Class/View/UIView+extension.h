//
//  UIView+extension.h
//  RUNTIME
//
//  Created by 高帅 on 2017/5/24.
//  Copyright © 2017年 高帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extension)
- (void)sTapActionWithBlock:(void (^)(void))block;


- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture;
@end

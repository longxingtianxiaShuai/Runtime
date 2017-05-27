//
//  UIView+extension.m
//  RUNTIME
//
//  Created by 高帅 on 2017/5/24.
//  Copyright © 2017年 高帅. All rights reserved.
//

#import "UIView+extension.h"
#import <objc/runtime.h>

struct TapAction {
    void *gestureTapKey;
    void *blockKey;
    
    
}tapAction;
@implementation UIView (extension)


- (void)sTapActionWithBlock:(void (^)(void))block
{
    
    //objc_getAssociatedObject(self, tapAction.gestureTapKey);
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self,tapAction.gestureTapKey);
    
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, tapAction.gestureTapKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, tapAction.blockKey, block, OBJC_ASSOCIATION_COPY);
}



- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, tapAction.blockKey);
        
        if (action)
        {
            action();
        }
    }
}


@end

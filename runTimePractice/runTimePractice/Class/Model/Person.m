//
//  Person.m
//  RUNTIME
//
//  Created by 高帅 on 2017/5/22.
//  Copyright © 2017年 高帅. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>



@implementation Person

//void myInstanceMethod(id obj,SEL _cmd,NSString *foodName){
//    NSLog(@"hello");
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(eat:)) {
//        class_addMethod([self class], sel, (IMP)myInstanceMethod, "v@:@");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

void missFoo(id obj, SEL _cmd,NSString *name)
{
    NSLog(@"Doing foo");
}
void fooMethod(id obj, SEL _cmd)
{
    NSLog(@"Doing foo");
}


+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if(aSEL == @selector(foo:)){
        class_addMethod([self class], aSEL, (IMP)missFoo, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
+ (BOOL)resolveClassMethod:(SEL)name {
    NSLog(@" >> Class resolving %@", NSStringFromSelector(name));
    if (name == @selector(eat)) {
        Class metaClass = objc_getMetaClass("Person");
        class_addMethod(metaClass, name, (IMP)fooMethod, "v@:");
        return YES;
    }
    
    return [super resolveClassMethod:name];
}

//+ (BOOL)resolveClassMethod:(SEL)sel{
//    
//    Class metaClass = objc_getMetaClass(class_getName(self));
//    IMP imp = [self instanceMethodForSelector:@selector(fooMethod)];
//    //IMP imp = [self instanceMethodForSelector:@selector(eat)];
//    if (sel == @selector(eat)) {
//       
//        class_addMethod(metaClass, sel, imp, "v@:");
//        return YES;
//        
//    }
//    return [super resolveClassMethod:sel];
//    
//}
@end

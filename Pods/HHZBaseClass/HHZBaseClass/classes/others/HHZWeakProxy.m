//
//  HHZWeakProxy.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 2017/1/13.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZWeakProxy.h"

@interface HHZWeakProxy()
/**
 *  代理Agent
 */
@property (nullable, nonatomic, weak) id target;
@end

@implementation HHZWeakProxy

+(instancetype)proxyWithTarget_hhz:(id)target
{
    return [[HHZWeakProxy alloc] initWithTarget:target];
}

-(instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}


#pragma mark 重写相应方法
-(id)forwardingTargetForSelector:(SEL)selector
{
    return _target;
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    void * null = NULL;
    [invocation setReturnValue:&null];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    return [_target respondsToSelector:aSelector];
}

-(BOOL)isEqual:(id)object
{
    return [_target isEqual:object];
}

-(NSUInteger)hash
{
    return [_target hash];
}

-(Class)superclass
{
    return [_target superclass];
}

-(Class)class
{
    return [_target class];
}

-(BOOL)isKindOfClass:(Class)aClass
{
    return [_target isKindOfClass:aClass];
}

-(BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    return [_target conformsToProtocol:aProtocol];
}

-(BOOL)isProxy
{
    return YES;
}

-(NSString *)description
{
    return [_target description];
}

-(NSString *)debugDescription
{
    return [_target debugDescription];
}


@end

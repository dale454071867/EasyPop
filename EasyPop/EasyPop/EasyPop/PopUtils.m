//
//  PopUtils.m
//  ZJFramework
//
//  Created by 周杰 on 15/6/5.
//  Copyright (c) 2015年 DL. All rights reserved.
//


#import "PopUtils.h"
static NSArray *propertyNameArray;
//反弹系数
#define SPRINGBOUNCINESS 20
//速度
#define SPRINGSPEED 10



@implementation PopUtils

/**
 *  初始化常用动画类型数组
 */
+(void)initData
{
    propertyNameArray = @[  kPOPLayerScaleXY,
                            kPOPLayerBackgroundColor,
                            kPOPLayerBounds,
                            kPOPLayerOpacity,
                            kPOPLayerPosition,
                            kPOPLayerRotation,
                            kPOPLayerSize,
                            kPOPLayerTranslationXY,
                            kPOPLayerRotationX,
                            kPOPLayerRotationY];
}

+(void)springAnimationPropertyName:(PopPropertyName)propertyName toValue:(id)toValue addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPSpringAnimation *popAnim))springBlock
{
    [self initData];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:propertyNameArray[propertyName]];
    anim.toValue = toValue;
    anim.springBounciness = 20;
    anim.springSpeed = 10;
    NSString *animationKey = springBlock?springBlock(anim):nil;
    [layer pop_addAnimation:anim forKey:animationKey];
}

+(void)springAnimationPropertyName:(PopPropertyName)propertyName velocity:(id)velocity addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPSpringAnimation *popAnim))springBlock
{
    [self initData];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:propertyNameArray[propertyName]];
    anim.velocity = velocity;
    anim.springBounciness = 20;
    anim.springSpeed = 10;
    NSString *animationKey = springBlock?springBlock(anim):nil;
    [layer pop_addAnimation:anim forKey:animationKey];
}

+(void)decayAnimationPropertyName:(PopPropertyName)propertyName velocity:(id)velocity addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPDecayAnimation *popAnim))decayBlock
{
    [self initData];
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:propertyNameArray[propertyName]];
    anim.velocity = velocity;
    anim.deceleration = 0.998;
    NSString *animationKey = decayBlock?decayBlock(anim):nil;
    [layer pop_addAnimation:anim forKey:animationKey];
}

+(void)basicAnimationPropertyName:(PopPropertyName)propertyName duration:(CGFloat)duration toValue:(id)toValue addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPBasicAnimation *popAnim))basicBlock
{
    [self initData];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:propertyNameArray[propertyName]];
    anim.duration = duration;
    anim.toValue = toValue;
    NSString *animationKey = basicBlock?basicBlock(anim):nil;
    [layer pop_addAnimation:anim forKey:animationKey];
}

+(void)runNumberAnimationBeginNumber:(NSNumber*)beginNumber endNumber:(NSNumber*)endNumber duration:(CGFloat)duration stringFormat:(NSString*)stringFormat addLabel:(UILabel*)label addOtherConditions:(NSString* (^)(POPBasicAnimation *popAnim))basicBlock
{
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) { prop.readBlock = ^(id obj, CGFloat values[]) {
        values[0] = [[obj description] floatValue];};
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:stringFormat,values[0]]];
        };
    }];
    anim.property = prop;
    anim.fromValue = beginNumber;
    anim.toValue = endNumber;
     NSString *animationKey = basicBlock?basicBlock(anim):nil;
    [label pop_addAnimation:anim forKey:animationKey];
}
@end

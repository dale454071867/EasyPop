//
//  PopUtils.h
//  ZJFramework
//
//  Created by 周杰 on 15/6/5.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pop.h"

typedef enum {
    zkPOPLayerScaleXY = 0,          //宽高放大比例  Point->Value
    zkPOPLayerBackgroundColor,      //背景色   UIColor
    zkPOPLayerBounds,               //锚点位置不变改变大小  rect->Value
    zkPOPLayerOpacity,              //透明度    number 0～1
    zkPOPLayerPosition,             //锚点位置   point->value
    zkPOPLayerRotation,             //旋转度    M_PI->number
    zkPOPLayerSize,                 //同kPOPLayerBounds传入value不一样  size->value
    zkPOPLayerTranslationXY,        //相对位移   point->Value
    zkPOPLayerRotationX,            //上下翻转      M_PI->number
    zkPOPLayerRotationY,            //左右翻转      M_PI->number
}PopPropertyName;





@interface PopUtils : NSObject

/**
 *  spring动画
 *
 *  @param propertyName 执行动画名字
 *  @param toValue      终值
 *  @param layer        所添加的layer
 *  @param springBlock  如有需要对anima添加或修改在block里修改,返回animationKey
 */
+(void)springAnimationPropertyName:(PopPropertyName)propertyName toValue:(id)toValue addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPSpringAnimation *popAnim))springBlock;
/**
 *  spring动画
 *
 *  @param propertyName 执行动画名字
 *  @param velocity     初始速度
 *  @param layer        所添加的layer
 *  @param decayBlock   如有需要对anima添加或修改在block里修改,返回animationKey
 */

+(void)springAnimationPropertyName:(PopPropertyName)propertyName velocity:(id)velocity addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPSpringAnimation *popAnim))springBlock;
/**
 *  decay动画
 *
 *  @param propertyName 执行动画名字
 *  @param velocity     初始速度
 *  @param layer        所添加的layer
 *  @param decayBlock   如有需要对anima添加或修改在block里修改,返回animationKey
 */
+(void)decayAnimationPropertyName:(PopPropertyName)propertyName velocity:(id)velocity addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPDecayAnimation *popAnim))decayBlock;

/**
 *  basic动画
 *
 *  @param propertyName 执行属性名字
 *  @param duration     持续时间
 *  @param toValue      终值
 *  @param layer        所添加的layer
 *  @param basicBlock   如有需要对anima添加或修改在block里修改,返回animationKey
 */
+(void)basicAnimationPropertyName:(PopPropertyName)propertyName duration:(CGFloat)duration toValue:(id)toValue addLayer:(CALayer*)layer addOtherConditions:(NSString* (^)(POPBasicAnimation *popAnim))basicBlock;
/**
 *  跑数动画
 *
 *  @param beginNumber  开始数字
 *  @param endNumber    结束数字
 *  @param duration     持续时间
 *  @param stringFormat 格式化字符串 形如@"%.2f" 小数点后面两位，主要用来确定小数点后几位
 *  @param label        跑数label
 *  @param basicBlock   如有需要对anima添加或修改在block里修改,返回animationKey
 */
+(void)runNumberAnimationBeginNumber:(NSNumber*)beginNumber endNumber:(NSNumber*)endNumber duration:(CGFloat)duration stringFormat:(NSString*)stringFormat addLabel:(UILabel*)label addOtherConditions:(NSString* (^)(POPBasicAnimation *popAnim))basicBlock;
@end

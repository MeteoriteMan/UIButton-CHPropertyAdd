//
//  UIButton+CHPropertyAdd.h
//  CHButtonAddDemo
//
//  Created by 张晨晖 on 2018/9/3.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHUIButtonPropertyAlignmentType) {
    CHUIButtonPropertyAlignmentTypeLeft,//图片在左边
    CHUIButtonPropertyAlignmentTypeTop,//图片在上面
    CHUIButtonPropertyAlignmentTypeRight,//图片在右边
    CHUIButtonPropertyAlignmentTypeBottom,//图片在下面
};

@interface UIButton (CHPropertyAdd)

/// 图文排列格式
@property (nonatomic ,assign) CHUIButtonPropertyAlignmentType ch_alignmentType;

/// 文字与图片之间的间隙
@property (nonatomic ,assign) CGFloat ch_intervalImageTitle;

/// 内外边距.作用类似于contentEdgeInsets
@property (nonatomic ,assign) UIEdgeInsets ch_contentEdgeInsets;

/// 是否允许按钮高亮
@property (nonatomic ,assign) BOOL ch_shouldHighlighted;

@end

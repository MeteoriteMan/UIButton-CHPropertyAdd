
//
//  UIButton+CHPropertyAdd.m
//  CHButtonAddDemo
//
//  Created by 张晨晖 on 2018/9/3.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "UIButton+CHPropertyAdd.h"
#import <objc/runtime.h>

@implementation UIButton (CHPropertyAdd)

static char *ch_alignmentTypeKey = "ch_alignmentTypeKey";
static char *ch_intervalImageTitleKey = "ch_intervalImageTitleKey";
static char *ch_contentEdgeInsetsKey = "ch_contentEdgeInsetsKey";
static char *ch_shouldHighlightedKey = "ch_shouldHighlightedKey";

@dynamic ch_alignmentType;
@dynamic ch_intervalImageTitle;
@dynamic ch_contentEdgeInsets;
@dynamic ch_shouldHighlighted;

+ (void)load {
    Method layoutSubviews = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method ch_layoutSubviews = class_getInstanceMethod(self, @selector(ch_layoutSubviews));
    method_exchangeImplementations(layoutSubviews, ch_layoutSubviews);
}

- (void)setCh_alignmentType:(CHUIButtonPropertyAlignmentType)ch_alignmentType {
    objc_setAssociatedObject(self, ch_alignmentTypeKey, @(ch_alignmentType), OBJC_ASSOCIATION_ASSIGN);
}

- (CHUIButtonPropertyAlignmentType)ch_alignmentType {
    return [objc_getAssociatedObject(self, ch_alignmentTypeKey) integerValue];
}

- (void)setCh_intervalImageTitle:(CGFloat)ch_intervalImageTitle {
    objc_setAssociatedObject(self, ch_intervalImageTitleKey, @(ch_intervalImageTitle), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setCh_contentEdgeInsets:(UIEdgeInsets)ch_contentEdgeInsets {
    NSValue *value = [NSValue value:&ch_contentEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, ch_contentEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN);
}

- (UIEdgeInsets)ch_contentEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, ch_contentEdgeInsetsKey);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (void)setCh_shouldHighlighted:(BOOL)ch_shouldHighlighted {
    objc_setAssociatedObject(self, ch_shouldHighlightedKey, @(ch_shouldHighlighted), OBJC_ASSOCIATION_ASSIGN);
    if (ch_shouldHighlighted) {
        self.adjustsImageWhenHighlighted = YES;
    } else {
        self.adjustsImageWhenHighlighted = NO;
    }
}

- (BOOL)ch_shouldHighlighted {
    return [objc_getAssociatedObject(self, ch_shouldHighlightedKey) boolValue];
}

- (CGFloat)ch_intervalImageTitle {
    return [objc_getAssociatedObject(self, ch_intervalImageTitleKey) floatValue];
}

- (void)ch_layoutSubviews {
    [self ch_layoutSubviews];
    UIEdgeInsets ch_contentEdgeInsets = self.ch_contentEdgeInsets;
    CGFloat ch_contentEdgeInsetsTop = ch_contentEdgeInsets.top;
    CGFloat ch_contentEdgeInsetsLeft = ch_contentEdgeInsets.left;
    CGFloat ch_contentEdgeInsetsBottom = ch_contentEdgeInsets.bottom;
    CGFloat ch_contentEdgeInsetsRight = ch_contentEdgeInsets.right;
    switch (self.ch_alignmentType) {
        case CHUIButtonPropertyAlignmentTypeLeft:{//默认.不做处理
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - self.ch_intervalImageTitle / 2, 0, self.ch_intervalImageTitle / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, self.ch_intervalImageTitle / 2, 0, - self.ch_intervalImageTitle / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(ch_contentEdgeInsetsTop, ch_contentEdgeInsetsLeft + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsBottom, ch_contentEdgeInsetsRight + self.ch_intervalImageTitle / 2);
        }
            break;
        case CHUIButtonPropertyAlignmentTypeTop:{
            self.imageEdgeInsets = UIEdgeInsetsMake(- self.titleLabel.intrinsicContentSize.height / 2 - self.ch_intervalImageTitle / 2, self.titleLabel.intrinsicContentSize.width / 2, self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2, - self.titleLabel.intrinsicContentSize.width / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.currentImage.size.height / 2 + self.ch_intervalImageTitle / 2, - self.currentImage.size.width / 2, - self.currentImage.size.height / 2 - self.ch_intervalImageTitle / 2, self.currentImage.size.width / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(ch_contentEdgeInsetsTop + self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsLeft - self.titleLabel.intrinsicContentSize.width / 2, ch_contentEdgeInsetsBottom + self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsRight - self.titleLabel.intrinsicContentSize.width / 2);
        }
            break;
        case CHUIButtonPropertyAlignmentTypeRight:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.intrinsicContentSize.width + self.ch_intervalImageTitle / 2, 0, - self.titleLabel.intrinsicContentSize.width - self.ch_intervalImageTitle / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - self.currentImage.size.width - self.ch_intervalImageTitle / 2 , 0, self.currentImage.size.width + self.ch_intervalImageTitle / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(ch_contentEdgeInsetsTop, ch_contentEdgeInsetsLeft + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsBottom, ch_contentEdgeInsetsRight + self.ch_intervalImageTitle / 2);
        }
            break;
        case CHUIButtonPropertyAlignmentTypeBottom:{
            self.imageEdgeInsets = UIEdgeInsetsMake(self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2 , self.titleLabel.intrinsicContentSize.width / 2, - self.titleLabel.intrinsicContentSize.height / 2 - self.ch_intervalImageTitle / 2, - self.titleLabel.intrinsicContentSize.width / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(- self.currentImage.size.height / 2 - self.ch_intervalImageTitle / 2, - self.currentImage.size.width / 2, self.currentImage.size.height / 2 + self.ch_intervalImageTitle / 2, self.currentImage.size.width / 2);
            self.contentEdgeInsets = UIEdgeInsetsMake(ch_contentEdgeInsetsTop + self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsLeft - self.titleLabel.intrinsicContentSize.width / 2, ch_contentEdgeInsetsBottom + self.titleLabel.intrinsicContentSize.height / 2 + self.ch_intervalImageTitle / 2, ch_contentEdgeInsetsRight - self.titleLabel.intrinsicContentSize.width / 2);
        }
            break;
        default:
            break;
    }
}

@end

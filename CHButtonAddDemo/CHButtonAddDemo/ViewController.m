//
//  ViewController.m
//  CHButtonAddDemo
//
//  Created by 张晨晖 on 2018/9/3.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+CHPropertyAdd.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.button.alignmentType = CHUIButtonPropertyAlignmentTypeBottom;
//    NSInteger alignmentType = self.button.alignmentType;
//    CGFloat intervalImageTitle = self.button.intervalImageTitle;

//    self.button.alignmentType = CHUIButtonPropertyAlignmentTypeLeft;
//    self.button.alignmentType = CHUIButtonPropertyAlignmentTypeTop;
//    self.button.alignmentType = CHUIButtonPropertyAlignmentTypeRight;
    
    self.button.ch_alignmentType = CHUIButtonPropertyAlignmentTypeTop;
    self.button.ch_intervalImageTitle = 8;
//    self.button.ch_contentEdgeInsets = UIEdgeInsetsMake(8, 12, 8, 12);
    self.button.contentEdgeInsets = UIEdgeInsetsMake(8, 12, 8, 12);
    self.button.ch_shouldHighlighted = NO;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

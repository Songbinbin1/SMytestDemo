//
//  SBBComingView.h
//  Ucompanioner
//
//  Created by 宋彬彬 on 17/5/17.
//  Copyright © 2017年 chengshixin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBMyChatModel.h"
@interface SBBComingView : UIView
@property(nonatomic, strong) UIImageView *bgIageView;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)SBBMyChatModel *myChatModel;
//等级
@property (nonatomic, strong)UIImageView *gardenImage;
@property (nonatomic, strong)UIImageView *vipImage;
@end

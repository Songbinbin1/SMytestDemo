//
//  SBBComingView.m
//  Ucompanioner
//
//  Created by 宋彬彬 on 17/5/17.
//  Copyright © 2017年 chengshixin. All rights reserved.
//

#import "SBBComingView.h"
#import "UtilHelper.h"
#import "UserLevelModel.h"
@implementation SBBComingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initlizea];
    }
    return self;
}

-(void)initlizea{
    self.clipsToBounds=YES;
    self.bgIageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 20* RATIO_HEIGHT)];
    self.bgIageView.image=[UIImage imageNamed:@"zi@2x.png"];
    [self addSubview:self.bgIageView];
//    self.bgIageView.backgroundColor=[UIColor redColor];
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(40 * RATIO_WIDTH+10, 2, 200-40 * RATIO_WIDTH, 15 * RATIO_HEIGHT)];
    self.label.textColor=[UIColor whiteColor];
    self.label.backgroundColor=[UIColor clearColor];
    self.label.font=[UIFont systemFontOfSize:14];
    self.label.text=@"啊啊啊啊啊啊啊啊，来了";
    [self addSubview:self.label];
    
    self.vipImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, 0*RATIO_WIDTH, 15 * RATIO_HEIGHT)];
    self.vipImage.image=[UIImage imageNamed:@"yesvip"];
    [self addSubview:self.vipImage];
    
    self.gardenImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.vipImage.frame), 2, 35 * RATIO_WIDTH, 15 * RATIO_HEIGHT)];
   
    [self addSubview:self.gardenImage];
}
-(void)setMyChatModel:(SBBMyChatModel *)myChatModel{
    
    self.label.text=[NSString stringWithFormat:@"%@,来了",myChatModel.audienceName];
     CGSize chatName = [self.label.text boundingRectWithSize:CGSizeMake( 300, 15 * RATIO_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
   
   
//     self.bgIageView
    BOOL isVIP=NO;
    CGFloat gardewidth=35*RATIO_WIDTH;
    self.vipImage.frame=CGRectMake(5, 2, 0*RATIO_WIDTH, 15 * RATIO_HEIGHT);
    if ([myChatModel.garde rangeOfString:@"identity"].location !=NSNotFound) {
        NSDictionary   *dic=[UtilHelper parseJSONStringToNSDictionary:myChatModel.garde];
        UserLevelModel *userLevelModel=[UserLevelModel  mj_objectWithKeyValues:dic];
        if ([@"vip" isEqualToString:userLevelModel.identity]) {
            isVIP=YES;
            self.vipImage.frame=CGRectMake(5, 2, 35*RATIO_WIDTH, 15 * RATIO_HEIGHT);
        }
        if ([userLevelModel.grade integerValue]>16) {
//            myChatModel.garde = @"16";
            gardewidth=66*RATIO_WIDTH;
//             self.gardenImage.frame =CGRectMake(CGRectGetMaxX(self.vipImage.frame), 2, 35 * RATIO_WIDTH, 15 * RATIO_HEIGHT);
        }
        myChatModel.garde=userLevelModel.grade;
        
        
    }else{
        if ([myChatModel.garde integerValue]>16) {
            //            myChatModel.garde = @"16";
             gardewidth=66*RATIO_WIDTH;
//     self.gardenImage.frame = CGRectMake(CGRectGetMaxX(self.vipImage.frame), 2, 35 * RATIO_WIDTH, 15 * RATIO_HEIGHT);
        }
    }
    self.gardenImage.frame =CGRectMake(CGRectGetMaxX(self.vipImage.frame), 2, gardewidth, 15 * RATIO_HEIGHT);
    NSInteger  level=[myChatModel.garde integerValue];
    self.gardenImage.image= [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)level]];
    self.label.frame =  CGRectMake(CGRectGetMaxX(self.gardenImage.frame), 2, chatName.width, 15 * RATIO_HEIGHT);
    if(!isVIP){
         self.bgIageView.frame=CGRectMake(0, 0, chatName.width+gardewidth+15, 20* RATIO_HEIGHT);
        if(level<4){
            self.bgIageView.image=[UIImage imageNamed:@"cheng@2x.png"];
        }else if(level>=4&&level<8){
            self.bgIageView.image=[UIImage imageNamed:@"huang@2x.png"];
        }else if(level>=8&&level<12){
            self.bgIageView.image=[UIImage imageNamed:@"fen@2x.png"];
        }else{
            self.bgIageView.image=[UIImage imageNamed:@"zi@2x.png"];
        }

    }else{
        self.bgIageView.frame=CGRectMake(0, 0, chatName.width+gardewidth+15+37*RATIO_WIDTH, 20* RATIO_HEIGHT);
        self.bgIageView.image=[UIImage imageNamed:@"VIP_bgc.png"];
    }
    
}
@end

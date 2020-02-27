//
//  HNStringUtil.m
//  SunsetLive
//
//  Created by 宋彬彬 on 2020/2/25.
//  Copyright © 2020 HN. All rights reserved.
//

#import "HNStringUtil.h"

@implementation HNStringUtil
+(NSString *)numberWithString:(NSInteger )number{
    NSString *numberString=[NSString stringWithFormat:@"%ld",(long)number];
    if (number>1000) {
        numberString=[NSString stringWithFormat:@"%ldk",number/1000];
    }
    NSLog(@"%@",numberString);
    return numberString;
}
@end

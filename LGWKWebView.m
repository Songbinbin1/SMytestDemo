//
//  HNWKWebView.m
//  SunsetLive
//
//  Created by 龙骏 on 2018/11/26.
//  Copyright © 2018年 HN. All rights reserved.
//

#import "LGWKWebView.h"

@implementation LGWKWebView

- (instancetype)init{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}
//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        [self setUI];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration{
    if (self = [super initWithFrame:frame configuration:configuration]) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    [self addSubview:self.myProgressView];
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}


#pragma mark - event response
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.myProgressView.alpha = 1.0f;
        [self.myProgressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                
                self.myProgressView.alpha = 0.0f;
            }completion:^(BOOL finished) {
                
                [self.myProgressView setProgress:0 animated:NO];
            }];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - getter and setter
- (UIProgressView *)myProgressView
{
    if (_myProgressView == nil) {
        _myProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        _myProgressView.tintColor = [UIColor blueColor];
        _myProgressView.trackTintColor = [UIColor whiteColor];
    }
    
    return _myProgressView;
}

// 记得取消监听
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"estimatedProgress"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

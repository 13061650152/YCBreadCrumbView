//
//  YCBreadCrumbView.m
//  aaa
//
//  Created by zyc on 16/4/23.
//  Copyright © 2016年 zyc. All rights reserved.
//
#define kScreen_Width   [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height  [[UIScreen mainScreen] bounds].size.height

#define kLeftPadding (10)
#define kImageTopPadding (15)
#define kRightPadding (10)
#define kImageWidth (10)

#import "YCBreadCrumbView.h"

@interface YCBreadCrumbView ()
@property (nonatomic, strong) UIScrollView *BGScrollView;
@property (nonatomic, assign) CGFloat totalLeft;
@property (nonatomic, assign) CGSize size;
@end


@implementation YCBreadCrumbView
@synthesize items = _items;


- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        _totalLeft = 10.0;
        _size = frame.size;
        if (!_BGScrollView) {
            _BGScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
            _BGScrollView.backgroundColor = [UIColor clearColor];
            _BGScrollView.showsHorizontalScrollIndicator = NO;
            [self addSubview:_BGScrollView];
        }
    }
    return self;
}



- (void)refreshUI{
    for (UIView *view in _BGScrollView.subviews) {
        [view removeFromSuperview];
    }
    _totalLeft = 10.0;

    for (int i = 0; i < self.items.count; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(_totalLeft, 10, [self widthForString:_items[i]], _size.height - 20);
        _totalLeft += ([self widthForString:_items[i]] + kLeftPadding);
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:_items[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(clickItemBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        btn.tag = 2016042300 + i;
        [_BGScrollView addSubview:btn];
        
        if (i != self.items.count - 1) {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rightArrow"]];
            imageView.frame = CGRectMake(_totalLeft, kImageTopPadding, kImageWidth, 10);
            _totalLeft += (kImageWidth + 10);
            [_BGScrollView addSubview:imageView];
        }
    }
    _BGScrollView.contentSize = CGSizeMake(_totalLeft, _size.height);
    if (_totalLeft > kScreen_Width) {
        [_BGScrollView scrollRectToVisible:CGRectMake(_totalLeft - kScreen_Width, 0, kScreen_Width, 40) animated:YES];
    }
}

- (void)clickItemBtn:(UIButton *)button
{
    if ([_delegate respondsToSelector:@selector(breadCrumbView:didTapItemAtIndex:)]) {
        [self.delegate breadCrumbView:self didTapItemAtIndex:button.tag - 2016042300];
    }
}

- (void)setItems:(NSArray *)item{

    _items = item;
    [self refreshUI];
}

- (CGFloat)widthForString:(NSString *)string{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, _size.height - 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.width;
}

@end

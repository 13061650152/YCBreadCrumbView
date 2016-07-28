//
//  YCBreadCrumbView.h
//  aaa
//
//  Created by zyc on 16/4/23.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCBreadCrumbView;
@protocol YCBreadCrumbViewDelegate <NSObject>

@optional
- (void)breadCrumbView:(YCBreadCrumbView *)view didTapItemAtIndex:(NSInteger)index;

@end


@interface YCBreadCrumbView : UIView
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) id<YCBreadCrumbViewDelegate> delegate;

- (void)setItems:(NSArray *)item;

@end

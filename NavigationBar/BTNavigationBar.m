//
//  BTNavigationBar.m
//  NavigationBar
//
//  Created by ThuyenBV on 2/20/17.
//  Copyright © 2017 BUVATY. All rights reserved.
//

#import "BTNavigationBar.h"

CGFloat const BTNavigationBarHeight = 44.0;
CGFloat const BTStatusBarHeight = 20.0;

@implementation BTNavigationBar

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.translucent = NO;
    self.clipsToBounds = NO;
}

- (CGSize)sizeThatFits:(CGSize)size {
    
    CGSize _size = [super sizeThatFits:size];
    _size.height += _extraHeight;
    return _size;
}

- (void)setExtraHeight:(CGFloat)extraHeight {
    _extraHeight = extraHeight;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.origin.y = ([[UIApplication sharedApplication] isStatusBarHidden] ? 0 : BTStatusBarHeight) - _extraHeight;
    
    self.frame = frame;
    
    NSArray *classNamesToReposition = @[@"_UINavigationBarBackground",@"_UIBarBackground"];
    for (UIView *view in [self subviews]) {
        if ([classNamesToReposition containsObject:NSStringFromClass([view class])]) {
            CGRect bounds = [self bounds];
            CGRect frame = [view frame];
            frame.origin.y    = bounds.origin.y - 20.f;
            frame.size.height = bounds.size.height + 20.f;
            [view setFrame:frame];
        }
    }
}

@end

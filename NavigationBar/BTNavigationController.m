//
//  BTNavigationController.m
//  NavigationBar
//
//  Created by ThuyenBV on 2/20/17.
//  Copyright © 2017 BUVATY. All rights reserved.
//

#import "BTNavigationController.h"
#import "BTNavigationBar.h"

@interface BTNavigationController ()


@end

@implementation BTNavigationController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithNavigationBarClass:[BTNavigationBar class] toolbarClass:nil];
    if (self) {
        [self initialize];
        self.viewControllers = @[rootViewController];
    }
    return self;
}

- (id)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass {
    self = [super initWithNavigationBarClass:navigationBarClass toolbarClass:nil];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
}

@end

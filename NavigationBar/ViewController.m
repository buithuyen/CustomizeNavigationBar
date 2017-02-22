//
//  ViewController.m
//  NavigationBar
//
//  Created by ThuyenBV on 2/20/17.
//  Copyright © 2017 BUVATY. All rights reserved.
//

#import "ViewController.h"
#import "BTNavigationBar.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Customize navibar";
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = button;
    self.navigationItem.rightBarButtonItem = button;
}

- (IBAction)hiddenSubViewButtonPressed:(id)sender {
    if ([self.navigationController.navigationBar isKindOfClass:[BTNavigationBar class]]) {
        ((BTNavigationBar*)self.navigationController.navigationBar).extraHeight = 0;
        [self.navigationController.navigationBar sizeToFit];
        
        if (self.subView) {
            [self.subView removeFromSuperview];
            self.subView = nil;
        }
    }
}

- (IBAction)showSubViewPressed:(id)sender {
    if ([self.navigationController.navigationBar isKindOfClass:[BTNavigationBar class]]) {
        ((BTNavigationBar*)self.navigationController.navigationBar).extraHeight = 44;
        [self.navigationController.navigationBar sizeToFit];
        
        if (self.subView == nil) {
            self.subView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 44)];
            self.subView.backgroundColor = [UIColor redColor];
            
            [[UIApplication sharedApplication].keyWindow addSubview:self.subView];

        }
        
    }
}

@end

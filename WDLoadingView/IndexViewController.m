//
//  IndexViewController.m
//  WDLoadingView
//
//  Created by 吴迪玮 on 16/2/24.
//  Copyright © 2016年 DNT. All rights reserved.
//

#import "IndexViewController.h"
#import "WDLoadingView.h"

@interface IndexViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@property (strong, nonatomic) WDLoadingView *loadview1;
@property (strong, nonatomic) WDLoadingView *loadview2;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadview1 = [[WDLoadingView alloc] initWithFrame:self.view1.bounds circleCount:7];
    [self.view1 addSubview:self.loadview1];
    self.loadview2 = [[WDLoadingView alloc] initWithFrame:self.view2.bounds circleCount:7];
    [self.view2 addSubview:self.loadview2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startView1:(id)sender {
    [self.loadview1 startAnimation];
}

- (IBAction)stopView1:(id)sender {
    [self.loadview1 stopAnimation];
}

- (IBAction)startView2:(id)sender {
    [self.loadview2 startAnimation];
}

- (IBAction)stopView2:(id)sender {
    [self.loadview2 stopAnimation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

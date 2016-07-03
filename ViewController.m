//
//  ViewController.m
//  WYBreathView
//
//  Created by 王玉 on 16/7/3.
//  Copyright © 2016年 王玉. All rights reserved.
//

#import "ViewController.h"
#import "WYAnimationView.h"

@interface ViewController ()
{
    WYAnimationView * m_breath;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WYAnimationView * breath = [[WYAnimationView alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    [self.view addSubview:breath];
    m_breath = breath;
    
    
    UIButton * start = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 40, 30)];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    [start setBackgroundColor:[UIColor grayColor]];
    [start addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    UIButton * stop = [[UIButton alloc] initWithFrame:CGRectMake(180, 200, 40, 30)];
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    [stop setBackgroundColor:[UIColor grayColor]];
    [stop addTarget:self action:@selector(stopAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stop];
}

-(void)startAnimation{
    [m_breath animation:YES];
}
-(void)stopAnimation{
    [m_breath animation:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  NoticeDemo
//
//  Created by mysj on 15/2/3.
//  Copyright (c) 2015年 moyogame. All rights reserved.
//

#import "ViewController.h"
#import "NoticeViewController.h"
#import "NoticeView.h"

@interface ViewController ()

@end

@implementation ViewController

static ViewController * instance = nil;
+(ViewController *)getInstance{
    if (instance == nil) {
        instance = [[ViewController alloc]init];
    }
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showNoticeViewClicked:(id)sender{
    NSLog(@"notice view show clicked.");
//    NoticeViewController *noticeView = [[NoticeViewController alloc]init];
//    [self.navigationController pushViewController:noticeView animated:YES];

//    NoticeViewController *noticeView = [[NoticeViewController alloc]init];
//    [self presentModalViewController:noticeView animated:YES];

//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 640,960)] ;
//    imageView.image = [UIImage imageNamed:@"notice_bg"];
//    [self.view addSubview:imageView];

    
//    [NoticeView displayNoticeView];
    
    
//    [self.view addSubview:[NoticeView showNoticeView]];
//    [self.view addSubview:NoticeViewController];
//    NoticeViewController *view = [[NoticeViewController alloc]init];
    
//    [self addChildViewController:view];
//    [self.view addSubview:view.view];
//    [NoticeView displayNoticeView];
    NSLog(@"notice 2");
    [NoticeView showTestView];
}

@end

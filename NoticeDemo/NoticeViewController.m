//
//  NoticeViewController.m
//  NoticeDemo
//
//  Created by mysj on 15/2/3.
//  Copyright (c) 2015年 moyogame. All rights reserved.
//

#import "NoticeViewController.h"
#import "ViewController.h"

@interface NoticeViewController()

@end

@implementation NoticeViewController

static NoticeViewController *instance = nil;
+(NoticeViewController *)getInstance{
    if (instance == nil) {
        instance = [[NoticeViewController alloc]init];
    }
    return instance;
}

-(void)viewDidLoad{
   
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    //get screen size
    float width = [[UIScreen mainScreen]bounds].size.width;
    float height = [[UIScreen mainScreen]bounds].size.height;
    
    float scaleX = width/540.0f;
    float scaleY = height/960.f;
    
    NSLog(@"width : %f  height :　%f  scaleX :%f  scaleY :%f",width,height,scaleX,scaleY);

    
    //add bg img
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width,height)] ;
    imageView.image = [UIImage imageNamed:@"notice_bg"];
    [self.view addSubview:imageView];
    
    //add yes btn
    UIImage *yesImg_norm = [UIImage imageNamed:@"btn_style122_normal.png"];
    UIImage *yesImg_pressed = [UIImage imageNamed:@"btn_style122_press.png"];
    float yesBtnW = yesImg_norm.size.width;
    float yesBtnH = yesImg_norm.size.height;
    float startX = width/2 - yesBtnW*scaleX/2;
    float startY = height - 9*scaleY - yesBtnH*scaleY;
    UIButton *yesBtn = [[UIButton alloc]initWithFrame:CGRectMake(startX, startY, yesBtnW*scaleX, yesBtnH*scaleY)];
    NSLog(@"w:%f h:%f x:%f y:%f",yesBtnW*scaleX,yesBtnH*scaleY,startX,startY);
//    UIButton *yesBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 178, 36)];
    
    [yesBtn setImage:yesImg_norm forState:UIControlStateNormal];
    [yesBtn setImage:yesImg_pressed forState:UIControlStateSelected];
    [yesBtn addTarget:self action:@selector(yesBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
//    [yesBtn setTitle:@"hello" forState:UIControlStateNormal];
//    [yesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [yesBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:5]];
    
//    yesBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    yesBtn.titleLabel.textAlignment = NSTextAlignmentLeft;

//    yesBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    yesBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
//    yesBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, -140, 0);
    
//    [yesBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.view addSubview:yesBtn];
    
    UILabel *yesLabel = [[UILabel alloc]initWithFrame:CGRectMake(startX, startY, yesBtnW*scaleX, yesBtnH*scaleY)];
    [yesLabel setText:@"确定"];
    yesLabel.textAlignment = NSTextAlignmentCenter;
    [yesLabel setBackgroundColor:[UIColor clearColor]];
    yesLabel.textColor = [UIColor whiteColor];
//    [yesLabel setFont:[UIFont systemFontOfSize:20]];
    [yesLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:28*scaleX]];
    [self.view addSubview:yesLabel];
    
    //add close btn
    UIImage *closeImg_norm = [UIImage imageNamed:@"btn_style107_normal.png"];
    UIImage *closeImg_pressed = [UIImage imageNamed:@"btn_style107_press.png"];
    float closeBtnW = closeImg_norm.size.width*scaleX;
    float closeBtnH = closeImg_norm.size.height*scaleY;
    float startX_closeBtn = width - 50*scaleX - closeBtnW;
    float startY_closeBtn = 80*scaleY+closeBtnH/2;
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(startX_closeBtn, startY_closeBtn, closeBtnW, closeBtnH)];
    [closeBtn setImage:closeImg_norm forState:UIControlStateNormal];
    [closeBtn setImage:closeImg_pressed forState:UIControlStateSelected];
    [closeBtn addTarget:self action:@selector(yesBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    //add webView
    float startX_webView = 38*scaleX;
    float startY_webView = 200 * scaleY;
    float webViewW = 470 * scaleX;
    float webViewH = 670 * scaleY;
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(startX_webView, startY_webView, webViewW, webViewH)];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setOpaque:NO];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    for(UIView *_aView in [webView subviews] ){
        if ([_aView isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)_aView setShowsVerticalScrollIndicator:NO]; //hide vertical scroll bar
            [(UIScrollView *)_aView setShowsHorizontalScrollIndicator:NO]; //hide horizontal scroll bar
            [(UIScrollView *)_aView setBounces:NO];
    
        }
    }
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://open.moyogame.com/conan/news.php?cid=1"]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://open.moyogame.com/conan/leavemessage.php"]];
    [webView loadRequest:request];
    [webView setDelegate:self];
    [self.view addSubview:webView];
}

-(void)yesBtnClicked:(UIButton *)sender{
    NSLog(@"yes btn clicked");
//    ViewController *viewController = [[ViewController alloc]init];
//    [self.navigationController pushViewController:viewController animated:YES];
    
}

//网页开始加载的时候调用
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webView startLoad.");
}

//网页加载完成的时候调用
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webView finish load.");
   
}

//网页加载出错的时候调用
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"webView load error.");
}

@end

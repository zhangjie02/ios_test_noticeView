//
//  NoticeView.h
//  ConanPro
//
//  Created by mysj on 15/2/4.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NoticeView : NSObject<UIWebViewDelegate>{
    
}
//@property(nonatomic,strong) UIView * noticeViewSub;
//+(NoticeView *)getInstance;
+(NoticeView *)showNoticeView;
+(void)displayNoticeView;
+(void)showTestView;
@end

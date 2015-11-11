//
//  SearchViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"

@interface SearchViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation SearchViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"召唤师查询";
    }
    return self;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
      
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = [UIColor whiteColor];

    NSURL *url = [NSURL URLWithString:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
#pragma mark - UIWebViewDelegate
//如果返回NO，则不会加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中的任意一项，跳转到下一页
    //如果当前webview加载的请求，不是当前页的
    if (navigationType != 5) {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}

@end

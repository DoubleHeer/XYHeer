//
//  TuWanHtmlViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlViewController.h"

@interface TuWanHtmlViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;

@end
@implementation TuWanHtmlViewController

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
    }
    return _webView;
}

-(instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
    
}
#pragma  mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];//旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];//隐藏提示
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}
@end

//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

-(id)initWithRequest:(NSURLRequest *)request;
@property (nonatomic,strong) NSURLRequest *request;

@end

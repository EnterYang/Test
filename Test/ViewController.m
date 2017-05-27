//
//  ViewController.m
//  test
//
//  Created by yangqingxu on 2017/5/26.
//  Copyright © 2017年 yangqingxu. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
static const int pageCount = 3;
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageControl.numberOfPages = pageCount;
    self.pageControl.userInteractionEnabled = NO;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    CGFloat W = self.scrollView.bounds.size.width;
    for (int i = 0; i<pageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%zd",i+1]]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self.scrollView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.scrollView.mas_top);
            make.left.mas_equalTo(self.scrollView.mas_left).offset(i*W);
            make.size.mas_equalTo(self.scrollView.bounds.size);
        }];
    }
    self.scrollView.contentSize = CGSizeMake(W*pageCount, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    float pageFloat = offsetX / scrollView.frame.size.width;
    
    self.pageControl.currentPage = (int)(pageFloat+0.5);
}


@end

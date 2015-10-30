//
//  ImageViewController.m
//  Top Places
//
//  Created by Sam Fisher on 10/23/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
}

#pragma mark - Properties
- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    _scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
}

- (void)setImage:(UIImage *)image
{
    self.scrollView.zoomScale = 1.0;
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
    [self.spinner stopAnimating];
    [self setZoomScaleToFillScreen];
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

#pragma mark - Delegate methods
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


- (void)fetchImage
{
    self.image = nil;
    if (!self.imageURL) return;
    
    [self.spinner startAnimating];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.imageURL
                                                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                    if (!error) {
                                                        if ([response.URL isEqual:self.imageURL]) {
                                                            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                self.image = image;
                                                            });
                                                        }
                                                    }
                                                }];
    [task resume];
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self fetchImage];
}

- (void)setZoomScaleToFillScreen
{
    double wScale = self.scrollView.bounds.size.width / self.imageView.image.size.width;
    double hScale = (self.scrollView.bounds.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height) / self.imageView.image.size.height;
    if (wScale > hScale)
    {
        self.scrollView.zoomScale = wScale;
    }
    else
    {
        self.scrollView.zoomScale = hScale;
    }
}

@end

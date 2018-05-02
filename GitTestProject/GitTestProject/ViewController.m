//
//  ViewController.m
//  GitTestProject
//
//  Created by irving on 2018/5/2.
//  Copyright © 2018年 irving. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSURL *sourceURL;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.sourceURL = [NSURL URLWithString:@"https://www.youtube.com/watch?v=J6vIS8jb6Fs"];
    self.item = [AVPlayerItem playerItemWithURL:self.sourceURL];
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
    self.playerLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 500);
    [self.view.layer addSublayer:self.playerLayer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myPlayer play];
    NSLog(@"start playing");
}





@end

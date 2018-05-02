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
    self.sourceURL = [NSURL URLWithString:@"https://fpdl.vimeocdn.com/vimeo-prod-skyfire-std-us/01/576/8/202884524/687898845.mp4?token=1525266848-0x243073e2e3318ab57cc5c0b39bee6306ed17af59"];
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

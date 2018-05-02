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

-(UISlider *)avSlider{
    if (!_avSlider) {
        _avSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height-20, [UIScreen mainScreen].bounds.size.width-20, 20)];
        [self.view addSubview:_avSlider];
        
    }
    return _avSlider;
}

-(void)avSliderAction{
    float seconds = self.avSlider.value;
    CMTime startTime = CMTimeMakeWithSeconds(seconds, self.item.currentTime.timescale);
    [self.myPlayer seekToTime:startTime completionHandler:^(BOOL finished) {
        if (finished) {
            [self playAction];
        }
    }];
}

-(UIButton *)myButton{
    if (!_myButton) {
        _myButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _myButton.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 20, 20, 20);
        _myButton.backgroundColor = [UIColor redColor];
        [_myButton setTitle:@"button" forState:UIControlStateNormal];
        [_myButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_myButton];
    }
    return _myButton;
}

-(void)playAction{
    if (self.isReadyToPlay) {
        [self.myPlayer play];
    }else{
        NSLog(@"loading video");
    }
}

-(void)avPlayerMethod{
    self.sourceURL = [NSURL URLWithString:@"https://fpdl.vimeocdn.com/vimeo-prod-skyfire-std-us/01/576/8/202884524/687898845.mp4?token=1525302985-0xf5c197284bdd11bcc32f197bfd97a985818d91aa"];
    self.item = [AVPlayerItem playerItemWithURL:self.sourceURL];
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    //self.playerLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 500);
    self.playerLayer.frame = [UIScreen mainScreen].bounds;
    [self.view.layer addSublayer:self.playerLayer];
    [self.item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [change [NSKeyValueChangeNewKey] intValue];
        switch (status) {
            case AVPlayerItemStatusFailed:
                NSLog(@"something goes wrong with item");
                self.isReadyToPlay = NO;
                break;
            case AVPlayerItemStatusReadyToPlay:
                NSLog(@"ready to play");
                self.isReadyToPlay = YES;
                self.avSlider.maximumValue = self.item.duration.value / self.item.duration.timescale;
                break;
            case AVPlayerItemStatusUnknown:
                NSLog(@"something goes wrong with the source of the video");
                self.isReadyToPlay = NO;
                break;
            default:
                break;
        }
    }
    [object removeObserver:self forKeyPath:@"status"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self avPlayerMethod];
    [self myButton];
    [self.avSlider addTarget:self action:@selector(avSliderAction) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchCancel|UIControlEventTouchUpOutside];
}





@end

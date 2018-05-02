//
//  ViewController.h
//  GitTestProject
//
//  Created by irving on 2018/5/2.
//  Copyright © 2018年 irving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController

@property (nonatomic, strong) AVPlayer *myPlayer;

@property (nonatomic, strong) AVPlayerItem *item;

@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end


//
//  ViewController.m
//  LMFetalMoveCounterProgress
//
//  Created by leihuiwu on 15/2/10.
//  Copyright (c) 2015年 leihuiwu. All rights reserved.
//

#import "ViewController.h"

#import "FetalMoveCounterProgressView.h"

@interface ViewController ()
{
	FetalMoveCounterProgressView *fetalMoveCounterProgressView;
	NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	UIImageView *bottomImageV = [[UIImageView alloc]initWithFrame:CGRectMake(54, 200, 212, 212)];
	bottomImageV.image = [UIImage imageNamed:@"annularBottomShow"];
	[self.view addSubview:bottomImageV];

    NSLog(@"Hello word");
	fetalMoveCounterProgressView = [[FetalMoveCounterProgressView alloc]initWithFrame:CGRectMake(0, 0, 194, 194)];
	fetalMoveCounterProgressView.center = CGPointMake(bottomImageV.frame.size.width / 2, bottomImageV.frame.size.height / 2);
	fetalMoveCounterProgressView.counterProgress = 0.1f;
	[bottomImageV addSubview:fetalMoveCounterProgressView];

	[self startTimer];
}

- (void)startTimer {
	timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testFetalMoveCounterProgress) userInfo:nil repeats:YES];
	[timer fire];
}

- (void)testFetalMoveCounterProgress {
	if (fetalMoveCounterProgressView.counterProgress >= 0.9) {
		[timer invalidate];
		timer = nil;
	}
	else {
		fetalMoveCounterProgressView.counterProgress += 1 / 100.0
        ;
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

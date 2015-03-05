//
//  FetalMoveCounterProgressView.m
//  LMFetalMoveCounterProgress
//
//  Created by leihuiwu on 15/2/10.
//  Copyright (c) 2015年 leihuiwu. All rights reserved.
//

#import "FetalMoveCounterProgressView.h"

#define     kOuterRaceWidth     14

@implementation FetalMoveCounterProgressView


- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        
        _arrowImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowBg"]];
        [self addSubview:_arrowImageV];
        [_arrowImageV setFrame:CGRectMake(0, 0, _arrowImageV.image.size.width, _arrowImageV.image.size.height)];
        _arrowImageV.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat radius = (self.bounds.size.width / 2 - kOuterRaceWidth) + 7;
    CGFloat startAngle = -((float)M_PI / 2);      // 90 degrees
    CGFloat endAngle = (2 * (float)M_PI) + startAngle;
    
    // Draw progress
    UIBezierPath *processPath = [UIBezierPath bezierPath];
    processPath.lineCapStyle = kCGLineCapRound;
    processPath.lineWidth = kOuterRaceWidth;
    endAngle = (self.counterProgress * 2 * (float)M_PI) + startAngle;
    [processPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"annularFrontShow"]];
    [color set];
    [processPath stroke];
    
    _arrowImageV.transform = CGAffineTransformMakeRotation(endAngle - startAngle);
}

- (void)setCounterProgress:(CGFloat)counterProgress
{
    _counterProgress = counterProgress;
    [self setNeedsDisplay];
}


@end

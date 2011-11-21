//
//  PinchesViewController.m
//  Pinches
//
//  Created by jeff on 8/15/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//
#import "PinchesViewController.h"

@implementation PinchesViewController
@synthesize label;
@synthesize initialDistance;
- (void)eraseLabel {
    label.text = @"";
}
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    label = nil;
}


- (void)dealloc {
    [label release];
    [super dealloc];
}
#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 2) {
        NSArray *twoTouches = [touches allObjects];
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        initialDistance = distanceBetweenPoints(
                                                [first locationInView:self.view], 
                                                [second locationInView:self.view]);
        NSLog(@"initialDistance = %f", initialDistance);
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if ([touches count] == 2) {
        NSArray *twoTouches = [touches allObjects];
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        CGFloat currentDistance = distanceBetweenPoints(
                                                        [first locationInView:self.view],
                                                        [second locationInView:self.view]);
        
        if (initialDistance == 0)
            initialDistance = currentDistance; 
        else if (currentDistance - initialDistance > kMinimumPinchDelta) {
            label.text = @"Outward Pinch";
            [self performSelector:@selector(eraseLabel) 
                       withObject:nil 
                       afterDelay:1.6f];
        }
        else if (initialDistance - currentDistance > kMinimumPinchDelta) {
            label.text = @"Inward Pinch";
            [self performSelector:@selector(eraseLabel) 
                       withObject:nil 
                       afterDelay:1.6f];
        }
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    initialDistance = 0;
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    initialDistance = 0;
}

@end

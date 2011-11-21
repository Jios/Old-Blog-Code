//
//  CardView.h
//  ©2008 Jeff LaMarche
//
// This code maybe used for any purpose, commercial or otherwise, without limitation.
// You may redistribute in whole or part, as well as create derivative works.
// You are NOT obligated to attribute the author, and you are NOT required to publish
// the source for projects that use this code.
//
// This code is provided with no warranty, express or implied. Use at your own risk.

#import <UIKit/UIKit.h>


#define kDefaultCornerRadius		10.0
#define kBackgroundColor			[UIColor whiteColor].CGColor

@class Card;
@interface CardView : UIView {
	Card	*card;
}
@property (nonatomic, retain) Card *card;
@end

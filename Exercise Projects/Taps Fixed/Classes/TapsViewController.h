#import <UIKit/UIKit.h>

@interface TapsViewController : UIViewController {
    UILabel *singleTapLabel;
    UILabel *doubleTaplabel;
    UILabel *tripleTapLabel;
    UILabel *quadrupleTapLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *singleTapLabel;
@property (nonatomic, retain) IBOutlet UILabel *doubleTaplabel;
@property (nonatomic, retain) IBOutlet UILabel *tripleTapLabel;
@property (nonatomic, retain) IBOutlet UILabel *quadrupleTapLabel;
@end


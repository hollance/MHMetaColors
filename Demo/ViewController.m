
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// NOTE: Under ARC using these "automatic methods" gives a compiler error
	// (No known class method for selector), without ARC it is just a warning
	// (Class method not found). I could not find a compiler flag to turn off
	// this warning, other than "-w" on the entire file.

	self.view.backgroundColor = [UIColor atomicTangerineColor];

	// Other things you can try:

	//self.view.backgroundColor = [UIColor xFA9705];
	//self.view.backgroundColor = [UIColor xFA970580];
	//self.view.backgroundColor = [UIColor x369];
	//self.view.backgroundColor = [UIColor x3698];
}

@end

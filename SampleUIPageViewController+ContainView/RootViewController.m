//
//  ViewController.m
//  SampleUIPageViewController+ContainView
//
//  Created by cHinn on 9/30/2558 BE.
//
//

#import "RootViewController.h"
#import "BaseUIPageViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) BaseUIPageViewController *basePageViewController;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.basePageViewController = self.childViewControllers[0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

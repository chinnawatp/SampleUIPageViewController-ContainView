//
//  BaseUIPageViewController.m
//  SampleUIPageViewController+ContainView
//
//  Created by cHinn on 9/30/2558 BE.
//
//

#import "BaseUIPageViewController.h"
#import "HomePageViewController.h"
#import "NewsFeedPageViewController.h"

@interface BaseUIPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (assign,nonatomic) NSUInteger nextIndex;
@property (assign,nonatomic) NSUInteger currentIndex;
@end

@implementation BaseUIPageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    HomePageViewController *p1 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"HomePageViewController"];
    NewsFeedPageViewController *p2 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"NewsFeedPageViewController"];
    self.pageViewContollerArray = @[p1,p2];
    [self setViewControllers:@[p1]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    self.delegate = self;
    self.dataSource = self;
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    
    UIViewController* controller = [pendingViewControllers firstObject];
    self.nextIndex = [self.pageViewContollerArray indexOfObject:controller];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    if(completed){
        
        self.currentIndex = self.nextIndex;
        
    }
    
    self.nextIndex = 0;
    
}

#pragma mark - Data Source

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerBeforeViewController:(UIViewController *)viewController
{
    // get the index of the current view controller on displayi
    NSUInteger currentIndex = [self.pageViewContollerArray indexOfObject:viewController];
    if (currentIndex > 0)
    {
        return [self.pageViewContollerArray objectAtIndex:currentIndex-1];
        // return the previous viewcontroller
    } else
    {
        return nil;
        // do nothing
    }
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerAfterViewController:(UIViewController *)viewController
{
    // get the index of the current view controller on display
    NSUInteger currentIndex = [self.pageViewContollerArray indexOfObject:viewController];
    // check if we are at the end and decide if we need to present
    // the next viewcontroller
    if (currentIndex < [self.pageViewContollerArray count]-1)
    {
        return [self.pageViewContollerArray objectAtIndex:currentIndex+1];
        // return the next view controller
    } else
    {
        return nil;
        // do nothing
    }
}

-(NSInteger)presentationCountForPageViewController:
(UIPageViewController *)pageViewController
{
    return self.pageViewContollerArray.count;
}

-(NSInteger)presentationIndexForPageViewController:
(UIPageViewController *)pageViewController
{
    return 0;
}

@end

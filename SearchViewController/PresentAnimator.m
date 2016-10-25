//
//  PresentAnimator.m
//  SearchViewController
//
//  Created by Robin on 16/10/9.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import "PresentAnimator.h"
#import "CustomSearchViewController.h"

@interface PresentAnimator ()<CAAnimationDelegate>{
    id<UIViewControllerContextTransitioning> testTransitionContext;
}

@end
@implementation PresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    testTransitionContext = transitionContext;
    UIViewController *firstVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *firstAniamtionTarget = [transitionContext viewForKey:UITransitionContextFromViewKey];

    UIViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *secondAnimationTarget = ((CustomSearchViewController *)secondVC).searchBarView;
    
    
    [transitionContext.containerView addSubview:firstVC.view];
    [transitionContext.containerView addSubview:secondVC.view];
    
    
    CABasicAnimation *transform_2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    transform_2.toValue = [NSValue valueWithCGAffineTransform:CGAffineTransformMakeScale(0.2, 0.2)];
    transform_2.duration = 0.35f;
    [firstAniamtionTarget.layer addAnimation:transform_2 forKey:@"positionY_2"];
    
    firstAniamtionTarget.backgroundColor = [UIColor redColor];

    
    CABasicAnimation *transform_1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    transform_1.fromValue = @(-64);
    transform_1.duration = 0.35f;
    transform_1.delegate = self;
    [secondAnimationTarget.layer addAnimation:transform_1 forKey:@"positionY_1"];

}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
       [testTransitionContext completeTransition:YES]; 
    }
}

@end

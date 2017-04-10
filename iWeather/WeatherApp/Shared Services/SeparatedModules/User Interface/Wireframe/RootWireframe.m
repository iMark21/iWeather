//
//  RootWireframe.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//


#import "RootWireframe.h"


@implementation RootWireframe


- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];

    return navigationController;
}

#pragma mark - Create ViewControllers

- (id)createViewControllerWithKey:(NSString *)key{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:key];
    if (!viewController) {
        NSLog(@"ERROR: createViewControllerWithKey");
    }
    return viewController;
}

@end

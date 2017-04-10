//
//  RootWireframe.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 1/4/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIkit.h>


@interface RootWireframe : NSObject

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window;
- (id)createViewControllerWithKey:(NSString *)key;

@end

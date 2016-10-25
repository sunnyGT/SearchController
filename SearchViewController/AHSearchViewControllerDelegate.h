//
//  AHSearchViewControllerDelegate.h
//  SearchViewController
//
//  Created by Robin on 16/10/10.
//  Copyright © 2016年 Robin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AHSearchViewControllerDelegate : NSObject <UISearchBarDelegate ,UISearchControllerDelegate, UISearchResultsUpdating>
- (instancetype)initWithTarget:(id)target;
@end

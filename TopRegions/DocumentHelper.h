//
//  DocumentHelper.h
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DocumentHelper : NSObject

+ (void)useDocumentWithOperation:(void (^)(UIManagedDocument *document, BOOL success))operation;

@end

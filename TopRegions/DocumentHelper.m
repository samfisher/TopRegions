//
//  DocumentHelper.m
//  TopRegions
//
//  Created by Sam Fisher on 11/5/15.
//  Copyright © 2015 Sam Fisher Apps. All rights reserved.
//

#import "DocumentHelper.h"
@interface DocumentHelper()

@property (nonatomic, strong) UIManagedDocument *document;
@property (nonatomic) BOOL preparingDocument;

@end

@implementation DocumentHelper

+ (void)useDocumentWithOperation:(void (^)(UIManagedDocument *document, BOOL success))operation
{
    DocumentHelper *dh = [DocumentHelper sharedDocumentHelper];
    [dh useDocumentWithOperation:operation];
}

+ (DocumentHelper *)sharedDocumentHelper
{
    static dispatch_once_t pred = 0;
    __strong static DocumentHelper *_sharedDocumentHelper = nil;
    dispatch_once(&pred, ^{
        _sharedDocumentHelper = [[self alloc] init];
    });
    return _sharedDocumentHelper;
}

#define DOCUMENT_NOT_READY_RETRY_TIMEOUT 1.0
- (void)useDocumentWithOperation:(void (^)(UIManagedDocument *document, BOOL success))operation
{
    UIManagedDocument *document = self.document;
    if ([self checkAndSetPreparingDocument]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSelector:@selector(useDocumentWithOperation:)
                       withObject:operation afterDelay:DOCUMENT_NOT_READY_RETRY_TIMEOUT];
        });
    } else {
        if (![[NSFileManager defaultManager] fileExistsAtPath:[document.fileURL path]]) {
            [document saveToURL:document.fileURL
               forSaveOperation:UIDocumentSaveForCreating
              completionHandler:^(BOOL success) {
                  operation(document, success);
                  self.preparingDocument = NO;
              }];
        } else if (document.documentState == UIDocumentStateClosed) {
            [document openWithCompletionHandler:^(BOOL success) {
                operation(document, success);
                self.preparingDocument = NO;
            }];
        } else {
            BOOL success = YES;
            operation(document, success);
            self.preparingDocument = NO;
        }
    }
}

#define DATABASE_DOCUMENT_NAME @"TopRegions"
- (UIManagedDocument *)document
{
    if (!_document) {
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                             inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:DATABASE_DOCUMENT_NAME];
        _document = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    return _document;
}

- (BOOL)checkAndSetPreparingDocument
{
    static dispatch_queue_t queue;
    if (!queue) {
        queue = dispatch_queue_create("Flickr Helper Queue", NULL);
    }
    __block BOOL result = NO;
    dispatch_sync(queue, ^{
        if (!_preparingDocument) {
            _preparingDocument = YES;
        } else {
            result = YES;
        }
    });
    return result;
}
@end

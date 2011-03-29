//
//  CSVController.h
//  CSVToTextile
//
//  Created by Christopher Curtis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CSVController : NSViewController {
    NSTextField * sourceTextField;
    NSTextField * outputTextField;
    NSTextField * label;
}

@property(nonatomic, retain) IBOutlet NSTextField * sourceTextField;
@property(nonatomic, retain) IBOutlet NSTextField * outputTextField;
@property(nonatomic, retain) IBOutlet NSTextField * label;

- (IBAction)openDocument:(id)sender;
- (IBAction)doConversion:(id)sender;

@end

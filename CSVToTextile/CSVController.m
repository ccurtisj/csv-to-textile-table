//
//  CSVController.m
//  CSVToTextile
//
//  Created by Christopher Curtis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CSVController.h"


@implementation CSVController
@synthesize sourceTextField, outputTextField, label;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        [label setHidden:YES];
    }
    
    return self;
}

- (IBAction)openDocument:(id)sender{
    NSOpenPanel *op = [NSOpenPanel openPanel];
    if ([op runModal] == NSOKButton)
    {
        NSString *filename = [op filename];
        
        [sourceTextField setStringValue:[NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil]];
        
    }
}

- (IBAction)doConversion:(id)sender{
    NSString * output = @"";
    
    NSString * input = [sourceTextField stringValue];
    input = [input stringByReplacingOccurrencesOfString:@"\r" withString:@"\n"];
    NSArray * lines = [input componentsSeparatedByString:@"\n"];
    
    BOOL firstRow = YES;
    for(NSString * line in lines){
        NSArray * components = [line componentsSeparatedByString:@","];
        
        for(NSString * component in components){
            if([[component stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
                component =@"&nbsp;";
            if(firstRow)
                output = [output stringByAppendingFormat:@"|. %@", component];
            else
                output = [output stringByAppendingFormat:@"| %@", component];
        }
        
        output = [output stringByAppendingString:@"|\n"];
        firstRow = NO;
    }
    
    [outputTextField setStringValue:output];
    
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSArray *types = [NSArray arrayWithObjects:NSStringPboardType, nil];
    [pb declareTypes:types owner:self];
    [pb setString: output forType:NSStringPboardType];
    
    [label setHidden:NO];
    [self performSelector:@selector(hideLabel:) withObject:nil afterDelay:2];
    
}

- (void)hideLabel:(id)sender{
    [label setHidden:YES];
}

- (void)dealloc
{
    [super dealloc];
}

@end

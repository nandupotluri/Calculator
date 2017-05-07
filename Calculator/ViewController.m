//
//  ViewController.m
//  Calculator
//
//  Created by Vamsi Mohan on 4/20/17.
//  Copyright © 2017 Vamsi Mohan. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsTyping;
@property (nonatomic,strong) CalculatorModel *modelConnection;
@property (nonatomic,strong) NSMutableArray *programOutput;
@end

@implementation ViewController
@synthesize display = _display;
@synthesize userIsTyping = _userIsTyping;
@synthesize modelConnection = _modelConnection;
@synthesize programDisplay  = _programDisplay;
@synthesize programOutput = _programOutput;

-(NSMutableArray*)programOutput{
    if(_programOutput == nil)
        _programOutput = [[NSMutableArray alloc] init];
    return _programOutput;
}

-(CalculatorModel*)modelConnection{
    if (!_modelConnection)
        _modelConnection = [[CalculatorModel alloc] init];
    return _modelConnection;
}
int count=0;

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if(self.userIsTyping){
        if([@"." isEqualToString:digit])
            count++;
        if (count<=1)
            self.display.text = [self.display.text stringByAppendingString:digit];
        else{
            self.display.text = [self.display.text substringToIndex:[self.display.text length]];
            count--;
        }
    }
    else{
        self.display.text = digit;
        self.userIsTyping = YES;
    }
}


- (IBAction)operationPressed:(UIButton *)sender {
    [self.programOutput addObject:[sender currentTitle]];
    self.programDisplay.text = [self.programOutput componentsJoinedByString:@" "];
    if(self.userIsTyping)
        [self equalToPressed];
    double result = [self.modelConnection performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
    self.programDisplay.text = [self.programDisplay.text stringByAppendingString:@"="];
}

- (IBAction)equalToPressed {
    [self.programOutput addObject:self.display.text];
    self.programDisplay.text = [self.programOutput componentsJoinedByString:@" "];
    [self.modelConnection pushOperand:[self.display.text doubleValue]];
    self.userIsTyping = NO;
    count = 0;
}
- (IBAction)clearPressed {
    self.programDisplay.text = @"0";
    [self.programOutput removeAllObjects];
    self.display.text = @"0";
    [self.modelConnection clearOperandStack:YES];
}
- (IBAction)backSpacePressed {
    if(self.userIsTyping){
        self.display.text = [self.display.text substringToIndex:[self.display.text length]-1];
    }
}

@end

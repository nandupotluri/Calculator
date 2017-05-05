//
//  CalculatorModel.m
//  Calculator
//
//  Created by Vamsi Mohan on 4/20/17.
//  Copyright © 2017 Vamsi Mohan. All rights reserved.
//

#import "CalculatorModel.h"
#include <math.h>
@interface CalculatorModel()
@property(nonatomic,strong) NSMutableArray *operandStack;

@end


@implementation CalculatorModel
@synthesize operandStack = _operandStack;

-(void)setOperandStack:(NSMutableArray *)operandStack{
    operandStack = _operandStack;
}

-(NSMutableArray *)operandStack{
    if (_operandStack == nil)
        _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void)pushOperand:(double)operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(void)clearOperandStack:(BOOL)YN{
    if(YN==YES){
        [self.operandStack removeAllObjects];
    }
}
-(double)popOperand{
    NSNumber *operand1 = [self.operandStack lastObject];
    if(operand1)
        [self.operandStack removeLastObject];
    return [operand1 doubleValue];
}

-(double)performOperation:(NSString *)operation{
    double result = 0;
    if([operation isEqualToString:@"+"])
        result = [self popOperand] + [self popOperand];
    else if([operation isEqualToString:@"−"])
        result = (- [self popOperand]) + ([self popOperand]);
    else if([operation isEqualToString:@"×"])
        result = [self popOperand] * [self popOperand];
    else if([operation isEqualToString:@"÷"])
        result = (1/[self popOperand])*([self popOperand]);
    else if([operation isEqualToString:@"sin"])
        result = sin([self popOperand]);
    else if([operation isEqualToString:@"cos"])
        result = cos([self popOperand]);
    else if([operation isEqualToString:@"√"])
        result = sqrt([self popOperand]);
    else if([operation isEqualToString:@"∏"])
        result = M_PI;
    [self pushOperand:result];
    return result;
}

@end

//
//  CalculatorModel.h
//  Calculator
//
//  Created by Vamsi Mohan on 4/20/17.
//  Copyright © 2017 Vamsi Mohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel: NSObject
-(void)pushOperand:(double)operand;
-(void)clearOperandStack:(BOOL)YN;
-(double)performOperation:(NSString *)operation;

@end

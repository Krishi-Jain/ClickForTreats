//
//  Parser.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/22/22.
//

#import "Parser.h"

@implementation Parser

// recipeInstructions was a key embedded in a JSON block and when you start scanning the recipeInstructions, you are able to extract the steps for making the recipes

+ (nullable NSString *)extractBlockFromString:(NSString *)string {
    NSString * ParseKey = @"\"recipeInstructions\":";
    NSScanner *scanner = [[NSScanner alloc] initWithString:string];
    if(![scanner scanUpToString:ParseKey intoString:nil]) {
        return nil;
    }   // Advance the cursor to the ParseKey
    NSString *body = nil;
    // Scans the string until a ] is encountered, accumulating characters into a string that’s returned by reference.
    [scanner scanUpToString:@"]" intoString:&body];
    // To retrieve the unscanned remainder of the string
    return [[body substringFromIndex:ParseKey.length] stringByAppendingString:@"]"];
}

+ (nullable NSArray *)parseString:(NSString *)string {
    NSString *block = [self extractBlockFromString:string];
    if (block == nil) {
        return nil;
    }
    NSData *blockData = [block dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *items = [NSJSONSerialization JSONObjectWithData:blockData options:0 error:nil];
    return items;
}

@end

//
//  Parser.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/22/22.
//

#import "Parser.h"

@implementation Parser

+ (nullable NSString *)extractBlockFromString:(NSString *)string {
    NSString * ParseKey = @"\"recipeInstructions\":";
    NSScanner *scanner = [[NSScanner alloc] initWithString:string];
    if(![scanner scanUpToString:ParseKey intoString:nil]) {
        return nil;
    }   // Advance the cursor to the ParseKey
    NSString *body = nil;
    [scanner scanUpToString:@"]" intoString:&body];
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

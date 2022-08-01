//
//  Parser.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/22/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Parser : NSObject
+ (nullable NSArray *)parseString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END

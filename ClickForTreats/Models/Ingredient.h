//
//  Ingredient.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ingredient : NSObject
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSURL *iconURL;

- (id)initWithName:(NSString *)name iconURL:(NSURL *)iconURL;
@end

NS_ASSUME_NONNULL_END

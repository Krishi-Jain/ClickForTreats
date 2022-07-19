//
//  Ingredient.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import "Ingredient.h"

@implementation Ingredient

- (id)initWithName:(NSString *)name iconURL:(NSURL *)iconURL {
    self = [super init];
    if (self) {
        _name = name;
        _iconURL = iconURL;
    }
    return self;
}

@end

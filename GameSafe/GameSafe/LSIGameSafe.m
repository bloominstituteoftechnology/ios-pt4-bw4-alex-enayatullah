//
//  LSIGameSafe.m
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIGameSafe.h"

@implementation LSIGameSafe

- (instancetype)initWithName:(NSString *)firstName
                   lastName:(NSString *)lastName
                      level:(NSString *)level
                mainContact:(BOOL)mainContact {
    self = [super init];
    if (self) {
        _firstName = [firstName copy];
        _lastName = [lastName copy];
        _level = [level copy];
        _mainContact = mainContact;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *firstName = dictionary[@"firstname"];
    NSString *lastName = dictionary[@"lastname"];
    NSString *level = dictionary[@"level"];
    
    if (!firstName || !lastName || !level || !_mainContact) {
        return nil;
    }
    return [self initWithName:firstName lastName:lastName level:level mainContact:_mainContact];
}

@end

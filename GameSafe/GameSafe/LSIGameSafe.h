//
//  LSIGameSafe.h
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GameSafe)
@interface LSIGameSafe : NSObject

@property (nonatomic, copy, nonnull)NSString *level;
@property (nonatomic, copy, nonnull)NSString *firstName;
@property (nonatomic, copy)NSString *lastName;
@property (nonatomic, readonly, getter=isMainContact) BOOL mainContact;
@property (nonatomic, copy)NSUUID *identifier;

- (nonnull instancetype)initWithName:(nonnull NSString *)firstName
                            lastName:(nonnull NSString *)lastName
                               level:(nonnull NSString *)level
                         mainContact:(BOOL)mainContact;

- (nullable instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

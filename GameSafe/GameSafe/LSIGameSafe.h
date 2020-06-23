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
@property (nonatomic, copy)NSString *mainContact; //main contact
@property (nonatomic, copy)NSString *backupContact; // back contact
@property (nonatomic, copy)NSUUID *identifier;

@end

NS_ASSUME_NONNULL_END

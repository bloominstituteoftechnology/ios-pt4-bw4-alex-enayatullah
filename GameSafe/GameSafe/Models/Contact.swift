//
//  Contact.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/21/20.
//  Copyright © 2020 BloomTech. All rights reserved.
//

import Foundation
import Contacts

struct Contact: Hashable {
    var name: String
    var phoneNumber: String
    var isMainContact: Bool
}

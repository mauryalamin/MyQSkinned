//
//  UserData.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 5/18/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class UserData: NSObject {
    
    var firstName: String?
    var lastName: String?
    
    var email: String?
    var password: String?
    
    var zipCode: String?
    var country: String?
    
    // var sendMeInfo: Bool = true
    var learnAcctLinking: Bool = false
    // var agreeToterms: Bool = false
    
    var rememberMe: Bool = false
    
    var hubs = [Hub]()
    
    static let userData = UserData()

}


struct State {
    var currentState: String
    var timeStamp: NSDate
}
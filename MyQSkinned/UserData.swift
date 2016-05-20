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
    
    override init () {
        
        let hub0 = Hub()
        hub0.name = "My Home"
        hub0.serialNumber = "123-45-6789"
        hub0.type = "MyQ Garage"
        hubs.append(hub0)
        
        let hub1 = Hub()
        hub1.name = "Lake House"
        hub1.serialNumber = "987-65-4321"
        hub1.type = "MyQ Garage"
        hubs.append(hub1)
        
        let hub2 = Hub()
        hub2.name = "Paisley Park"
        hub2.serialNumber = "121-21-1212"
        hub2.type = "MyQ Garage"
        hubs.append(hub2)
        
        let hub3 = Hub()
        hub3.name = "Nest"
        hub3.serialNumber = "120-23-1897"
        hub3.type = "Nest"
        hubs.append(hub3)
        
        
        // My House
        let hub0accessory0 = Accessory()
        hub0accessory0.name = "Garage Door 1"
        hub0accessory0.type = "GDO"
        hub0accessory0.type = "gdo-closed"
        hub0.accessories.append(hub0accessory0)
        
        let hub0accessory1 = Accessory()
        hub0accessory1.name = "Garage Door 2"
        hub0accessory1.type = "GDO"
        hub0accessory1.type = "gdo-closed"
        hub0.accessories.append(hub0accessory1)
        
        let hub0accessory2 = Accessory()
        hub0accessory2.name = "Front Light"
        hub0accessory2.type = "LIGHT"
        hub0accessory2.type = "light-on"
        hub0.accessories.append(hub0accessory2)
        
        // Lake Home
        let hub1accessory0 = Accessory()
        hub1accessory0.name = "Garage Door"
        hub1accessory0.type = "GDO"
        hub1accessory0.type = "gdo-closed"
        hub1.accessories.append(hub1accessory0)
        
        let hub1accessory1 = Accessory()
        hub1accessory1.name = "Back Light"
        hub1accessory1.type = "LIGHT"
        hub1accessory1.type = "light-on"
        hub1.accessories.append(hub1accessory1)
        
        // Paisley Park
        let hub2accessory0 = Accessory()
        hub2accessory0.name = "Garage Door"
        hub2accessory0.type = "GDO"
        hub2accessory0.type = "gdo-closed"
        hub2.accessories.append(hub2accessory0)
        
        let hub2accessory1 = Accessory()
        hub2accessory1.name = "Back Light"
        hub2accessory1.type = "LIGHT"
        hub2accessory1.type = "light-on"
        hub2.accessories.append(hub2accessory1)
        
        let hub2accessory2 = Accessory()
        hub2accessory2.name = "Front Light"
        hub2accessory2.type = "LIGHT"
        hub2accessory2.type = "light-on"
        hub2.accessories.append(hub2accessory2)
        
        // Nest
        let hub3accessory0 = Accessory()
        hub3accessory0.name = "Thermostat"
        hub3accessory0.type = "THERMOSTAT"
        hub3accessory0.type = "therm-home"
        hub3.accessories.append(hub3accessory0)
        
        let hub3accessory1 = Accessory()
        hub3accessory1.name = "Living Room Cam"
        hub3accessory1.type = "CAMERA"
        hub3accessory1.type = "cam-on"
        hub3.accessories.append(hub3accessory1)
        
    }
    
    static let userData = UserData()

}


struct State {
    var currentState: String
    var timeStamp: NSDate
}
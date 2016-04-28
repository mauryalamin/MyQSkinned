//
//  ManagePlacesSection.swift
//  MyQSkinned
//
//  Created by Maury Alamin on 4/27/16.
//  Copyright © 2016 Alamin. All rights reserved.
//

import UIKit

class ManagePlacesSection {
    
    let name: String
    var entries: [String]
    
    init(name: String, entries: [String]) {
        self.name = name
        self.entries = entries
    }
    
    static func myqPlaces() -> ManagePlacesSection {
        var entries = [String]()
        entries.append("My Home")
        entries.append("Lake House")
        return ManagePlacesSection(name: "MyQ Places", entries: entries)
    }
    
    static func partnerDevices() -> ManagePlacesSection {
        var entries = [String]()
        entries.append("Nest Thermostat: Living Room")
        entries.append("Nest Cam")
        entries.append("Life 360")
        return ManagePlacesSection(name: "Linked Partner Devices", entries: entries)
    }
    
    static func managePlacesSections() -> [ManagePlacesSection] {
        return [ManagePlacesSection.myqPlaces(), ManagePlacesSection.partnerDevices()]
    }
    
}

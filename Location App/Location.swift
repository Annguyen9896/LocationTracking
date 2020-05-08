//
//  location.swift
//  Location App
//
//  Created by An Nguyen on 4/19/20.
//  Copyright © 2020 An Nguyen. All rights reserved.
//

import Foundation

final class Location: Codable{
    var username : String
    var lat: Double?
    var lon: Double?
    var uuid: String
    var major: Int?
    var minor: Int?
    var range: Int?
    
    init(username: String, lat: Double?, lon: Double?, uuid: String, major: Int?, minor: Int?, range: Int?){
        self.username = username
        self.lat = lat
        self.lon = lon
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.range = range
    }
}

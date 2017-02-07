//
//  Location.swift
//  RainyShineCloudy
//
//  Created by Guilherme Ruiz on 02/02/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    var latitude: Double!
    var longitude: Double!
    
    private init() {}
}

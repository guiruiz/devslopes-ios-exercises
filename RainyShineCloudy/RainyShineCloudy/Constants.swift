//
//  Constants.swift
//  RainyShineCloudy
//
//  Created by Guilherme Ruiz on 01/02/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let API_KEY = "bea3136a48efba96a4b98513ec516ef3"

let CURRENT_WEATHER_URL = "\(BASE_URL)weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"
let FORECAST_URL = "\(BASE_URL)forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=\(API_KEY)"

typealias DownloadComplete = () -> ()
typealias LocationRequestComplete = () -> ()

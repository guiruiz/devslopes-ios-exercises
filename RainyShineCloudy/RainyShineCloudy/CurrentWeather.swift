//
//  CurrentWeather.swift
//  RainyShineCloudy
//
//  Created by Guilherme Ruiz on 02/02/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        _date = dateFormatter.string(from: Date())
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict ["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = round(temp - 273.15)
                    }
                }
            }
            completed()
        }
    }
    
    
}

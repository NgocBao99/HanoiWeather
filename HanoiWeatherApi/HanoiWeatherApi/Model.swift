//
//  Model.swift
//  HanoiWeatherApi
//
//  Created by Ngoc on 7/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit



struct HanoiWeather: Codable {
    var city: City
    var list: [List]
}

    struct City: Codable {
        var name: String
        var timezone: Double
    }

    struct List: Codable {
        var dt: TimeInterval
        var temp: Temp
        var weather: [Weather]
        
        struct Temp: Codable {
            var day: Double
            var min: Double
            var max: Double
        }
        
        struct Weather: Codable {
            var main: String
            var description: String
        }
    }

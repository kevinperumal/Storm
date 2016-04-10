//
//  CurrentWeather.swift
//  Storm
//
//  Created by Kevin Perumal on 4/8/16.
//  Copyright © 2016 Kevin Perumal. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    init(weatherDictionary : [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityFloat = weatherDictionary["humidity"] as? Float {
            humidity = Int(humidityFloat * 100)
        } else {
            humidity = nil
        }
        
        if let precipFloat = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipFloat * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary["summary"] as? String
    }
    
}
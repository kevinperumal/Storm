//
//  ViewController.swift
//  Storm
//
//  Created by Kevin Perumal on 4/8/16.
//  Copyright © 2016 Kevin Perumal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?

    private let forecastAPIKey = "b7402ea41ff33993076ef2bc0851b099"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.423)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let currently) in
            if let currentWeather = currently {
                dispatch_async(dispatch_get_main_queue()) {
                    
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let precip = currentWeather.precipProbability {
                        self.currentPrecipitationLabel?.text = "\(precip)%"
                    }
                    
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
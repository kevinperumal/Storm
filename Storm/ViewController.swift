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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        // Use NSURLSession
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        // Request object
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) -> Void in
            print(data)
            print("im on a background thread")
        })
        print("im on the main thread")
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
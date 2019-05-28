//
//  Weather.swift
//  JSONweatherAPI
//
//  Created by Admin on 5/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct weather {
    let summary:String
    let icon:String
    let temperature:Double
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    init(json:[String: Any]) throws {
        guard let summary = json["summary"] as? String else {
            throw SerializationError.missing("summary is missing")}
        
        guard let icon = json["icon"] as? String else {
            throw SerializationError.missing("icon is missing")
        }
        
        guard let temperature = json["temperatureMax"] as? Double else {
            throw SerializationError.missing("temperature is missing")
        }
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    static let basePath = "https://api.darksky.net/forecast/78157dfecc935879301d8339658f5b23/"
    static func forcast (withLocation location:String, completion: @escaping ([weather])->()) {
        
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse?, error: Error?) in
            var forecastArray: [weather] = []
            if let data = data{
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        
                        if var dailyForecasts = json["daily"] as? [String:Any]{
                            
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]]{
                                
                                for dataPoint in dailyData{
                                    
                                    if let weatherObject = try? weather(json: dataPoint){
                                        
                                        forecastArray.append(weatherObject)
                                        
                                    }
                                }
                            }
                        }
                    }
                }catch {
                    
                    print(error.localizedDescription)
                    
                }
                
                completion(forecastArray)
            }
        }
        
        task.resume()
    }
}

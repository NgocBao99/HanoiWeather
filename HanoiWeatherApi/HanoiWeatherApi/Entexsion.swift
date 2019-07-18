//
//  Entexsion.swift
//  HanoiWeatherApi
//
//  Created by Ngoc on 7/18/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit


extension TimeInterval {
     func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy" // This formate is input formated .
        dateFormatter.locale = Locale(identifier: "EN")
        
        let getDayofweek = Date(timeIntervalSince1970: self)
      
        return dateFormatter.string(from: getDayofweek)
    }
    
    func formatTImeZone() -> String{
        let dateformater = DateFormatter()
        dateformater.dateFormat = "zzz"
        dateformater.locale = Locale(identifier: "EN")
        
        let getTimezoneofPlace = Date(timeIntervalSince1970: self)
        return dateformater.string(from: getTimezoneofPlace)
    }
    
}




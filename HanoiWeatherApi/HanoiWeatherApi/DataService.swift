//
//  DataService.swift
//  HanoiWeatherApi
//
//  Created by Ngoc on 7/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import Foundation

class DataService {
    static let sharedIntance: DataService = DataService()
    
    func getDataFomApi(completedHadle: @escaping(HanoiWeather) -> Void) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?lat=21.028511&lon=105.804817&cnt=10&mode=json&appid=c80a2e47667cedab4873abb8a9fff762&fbclid=IwAR2eIWRCKjAYI4Cyl1L-Uu1VBKE6jd5Kgm8qmjlKFiWI1k1xaBtnbbb9Cfo") else { return }
        
        let urlRequest = URLRequest(url: url)

        let dowloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            guard let aData = data else { return }
            do {
                let getData = try JSONDecoder().decode(HanoiWeather.self, from: aData)
                DispatchQueue.main.async {
                    completedHadle(getData)
                }
            } catch {
                print(error)
            }
        })
        dowloadTask.resume()
    }
}

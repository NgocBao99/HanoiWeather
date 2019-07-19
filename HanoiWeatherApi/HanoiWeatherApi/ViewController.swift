//
//  ViewController.swift
//  HanoiWeatherApi
//
//  Created by Ngoc on 7/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var citynameLabel: UILabel!
    @IBOutlet weak var cityDatetimeLabel: UILabel!
    @IBOutlet weak var cityCeliusLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var listWeather: HanoiWeather?
    override func viewDidLoad() {
        super.viewDidLoad()
      setDataFromApi()
    }

    func setDataFromApi(){
        DataService.sharedIntance.getDataFomApi { (data) in
            self.listWeather = data
            self.displayData()
            self.tableView.reloadData()
        }
    }
    
    func displayData(){
        citynameLabel.text = ((listWeather?.city.name)!) + " " + (listWeather?.city.timezone.formatTImeZone())!
       // "String(Int((listWeather?.city.timezone)!))"
        cityCeliusLabel.text = String(Int((listWeather?.list[0].temp.min.changeKtoC())!)) + " °C"
        cityDatetimeLabel.text = listWeather?.list[0].dt.getanotherformatDate()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listWeather?.list.count == nil {
            return 0
        } else {
            return (listWeather?.list.count)!
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
       cell.mainLabel.text = listWeather?.list[indexPath.row].weather[0].main
        cell.datetimalabel.text = listWeather?.list[indexPath.row].dt.getFormattedDate()
        cell.descriptionLabel.text = listWeather?.list[indexPath.row].weather[0].description
        cell.maxminLabel.text = String(Int((listWeather?.list[indexPath.row].temp.min.changeKtoC())!)) + "-" + String(Int((listWeather?.list[indexPath.row].temp.max.changeKtoC())!)) + " °C"
        return cell
    }
    

}


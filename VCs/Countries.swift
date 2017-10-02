//
//  Country.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//

import UIKit

class Countries: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let NotificationsLoadDataCountriesAndCities = Notification.Name.init("NotificationsLoadDataCountriesAndCities")
    
    var arrayData = [EntityCountry]()
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

    @IBOutlet weak var tableCountry: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
    }
    
    func loadData()  {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(Countries.reloadDataTable),
                                               name: Countries.NotificationsLoadDataCountriesAndCities,
                                               object: nil)
        
        self.arrayData = DataManager.accessManager.executeFetchRequestCountries()
        if self.arrayData.count == 0 {
            self.activityIndicator.startAnimating()
            RequestManager.accessManager.executeFetchRequestDataCountriesAndCities()
        }
    }
    
    @objc func reloadDataTable(notification: Notification) {
        
        self.arrayData = DataManager.accessManager.executeFetchRequestCountries()
        self.tableCountry.reloadData()
        self.activityIndicator.stopAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        let object = self.arrayData[indexPath.row]
        cell.textLabel?.text = object.nameCountry
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        DataManager.accessManager.selectedCountry = self.arrayData[indexPath.row]
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "CitiesID") as UIViewController
        self.present(vc, animated:true, completion:nil)
        
    }

}

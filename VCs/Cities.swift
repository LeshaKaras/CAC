//
//  Cities.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//

import UIKit

class Cities: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arrayData = [EntityCity]()

    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableCity: UITableView!
    
    @IBAction func actionBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        
        let country = DataManager.accessManager.selectedCountry
        self.navigationBar.topItem?.title = (country?.nameCountry)! + " - cities"
        self.arrayData = DataManager.accessManager.executeFetchRequestCitiesFromSelectedCountry()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cities", for: indexPath)
        
        let city = self.arrayData[indexPath.row]
        cell.textLabel?.text = city.nameCity
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
   

}

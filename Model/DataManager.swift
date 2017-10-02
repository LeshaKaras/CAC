//
//  DataManager.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    static let accessManager = DataManager()
    
    var selectedCountry:EntityCountry?
    
    func loadData(dictionaryResponse:NSDictionary) {
        
        let dict = dictionaryResponse as? [String : Array<String>]
        for object in dict! {
            
            let country = object.key
            if !country.isEmpty{
                
                let objectCountry = EntityCountry(name: country)
                
                let cities = object.value
                for city in cities {
                    if !city.isEmpty {
                        
                       let objectCity = EntityCity(name: city)
                        objectCountry.addToListCities(objectCity)
                        
                    }
                }
            }
        }
        
        DataManager.accessManager.saveContext()
        NotificationCenter.default.post(name: Countries.NotificationsLoadDataCountriesAndCities, object: nil)
    }
    
    func executeFetchRequestCountries() -> [EntityCountry] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntityCountry")
        let sort = NSSortDescriptor(key: "nameCountry", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let array = try DataManager.accessManager.persistentContainer.viewContext.fetch(fetchRequest) as! [EntityCountry]
            return array
        } catch {
            print("Error - executeFetchRequestCountries")
            return []
        }
        
    }
    
    func executeFetchRequestCitiesFromSelectedCountry() -> [EntityCity] {
        
        let set = selectedCountry?.listCities
        let array = setToArray(set: (set)!)
        
        let sort = NSSortDescriptor(key: "nameCity", ascending: true)
        let sortedByName = (array as NSArray).sortedArray(using: [sort])
        
        return sortedByName as! [EntityCity]
        
    }
    
    func setToArray(set:NSSet) -> [EntityCity] {
        
        var array = [EntityCity]()
        for obj in set {
            array.append(obj as! EntityCity)
              }
        return array
    }
    
    
    
    func entityForName(entityName:String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.persistentContainer.viewContext)!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CountryAndCity_Swift_4_")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

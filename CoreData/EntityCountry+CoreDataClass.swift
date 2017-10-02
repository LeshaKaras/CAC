//
//  EntityCountry+CoreDataClass.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//
//

import Foundation
import CoreData

@objc(EntityCountry)
public class EntityCountry: NSManagedObject {

    convenience init() {
        self.init(entity: DataManager.accessManager.entityForName(entityName: "EntityCountry"), insertInto: DataManager.accessManager.persistentContainer.viewContext)
    }
    convenience init(name:String) {
        self.init()
        self.nameCountry = name
    }
    
}

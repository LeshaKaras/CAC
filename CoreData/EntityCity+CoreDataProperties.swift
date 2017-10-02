//
//  EntityCity+CoreDataProperties.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//
//

import Foundation
import CoreData


extension EntityCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityCity> {
        return NSFetchRequest<EntityCity>(entityName: "EntityCity")
    }

    @NSManaged public var nameCity: String?
    @NSManaged public var ownerCountry: EntityCountry?

}

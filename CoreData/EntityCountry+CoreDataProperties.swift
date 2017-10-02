//
//  EntityCountry+CoreDataProperties.swift
//  CountryAndCity(Swift 4)
//
//  Created by Alexei Karas on 02.10.17.
//  Copyright © 2017 Alexei Karas. All rights reserved.
//
//

import Foundation
import CoreData


extension EntityCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityCountry> {
        return NSFetchRequest<EntityCountry>(entityName: "EntityCountry")
    }

    @NSManaged public var nameCountry: String?
    @NSManaged public var listCities: NSSet?

}

// MARK: Generated accessors for listCities
extension EntityCountry {

    @objc(addListCitiesObject:)
    @NSManaged public func addToListCities(_ value: EntityCity)

    @objc(removeListCitiesObject:)
    @NSManaged public func removeFromListCities(_ value: EntityCity)

    @objc(addListCities:)
    @NSManaged public func addToListCities(_ values: NSSet)

    @objc(removeListCities:)
    @NSManaged public func removeFromListCities(_ values: NSSet)

}

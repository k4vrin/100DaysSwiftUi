//
//  PicLocation+CoreDataProperties.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/31/23.
//
//

import Foundation
import CoreData


extension PicLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PicLocation> {
        return NSFetchRequest<PicLocation>(entityName: "PicLocation")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var picbel: PicbelEntity?

}

extension PicLocation : Identifiable {

}

//
//  PicbelEntity+CoreDataProperties.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/25/23.
//
//

import Foundation
import CoreData


extension PicbelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PicbelEntity> {
        return NSFetchRequest<PicbelEntity>(entityName: "PicbelEntity")
    }

    @NSManaged public var img_id: String?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var created_at: Date?

}

extension PicbelEntity : Identifiable {

}

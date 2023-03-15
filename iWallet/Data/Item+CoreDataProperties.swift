//
//  Item+CoreDataProperties.swift
//  iWallet
//
//  Created by Владислав Новошинский on 15.03.2023.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var amount: Double
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var type: String?
    @NSManaged public var categorys: NSSet?

}

// MARK: Generated accessors for categorys
extension Item {

    @objc(addCategorysObject:)
    @NSManaged public func addToCategorys(_ value: Category)

    @objc(removeCategorysObject:)
    @NSManaged public func removeFromCategorys(_ value: Category)

    @objc(addCategorys:)
    @NSManaged public func addToCategorys(_ values: NSSet)

    @objc(removeCategorys:)
    @NSManaged public func removeFromCategorys(_ values: NSSet)

}

extension Item : Identifiable {

}

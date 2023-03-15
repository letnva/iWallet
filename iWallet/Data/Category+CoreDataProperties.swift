//
//  Category+CoreDataProperties.swift
//  iWallet
//
//  Created by Владислав Новошинский on 15.03.2023.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var items: Item?

}

extension Category : Identifiable {

}

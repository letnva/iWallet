//
//  Persistence.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "iWallet")
    
    init() {
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

//
//  iWalletApp.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

@main
struct iWalletApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

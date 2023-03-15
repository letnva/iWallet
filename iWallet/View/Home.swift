//
//  Home.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    //@FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var items: FetchedResults<Item>
    //@FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse)]) var categorys: FetchedResults<Category>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)],
        predicate: NSPredicate(format: "%@ =[c] %@", Category() as CVarArg),
        animation: .default) var categorys: FetchedResults<Category>
    
    
    
    @State private var showingAddExpense = false
    @State private var showingAddCategory = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categorys) { category in
                    NavigationLink {
                        ItemsView()
                    } label: {
                        Text(category.name ?? "Unknown")
                    }
                }
            }
            .navigationTitle("iWallet")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddCategory = true
                    } label: {
                        Image(systemName: "list.bullet.rectangle.portrait")
                    }
                    .sheet(isPresented: $showingAddCategory) {
                        AddCategoryView()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .sheet(isPresented: $showingAddExpense) {
                        AddItems()
                        
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

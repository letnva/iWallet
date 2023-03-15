//
//  Home.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var categorys: FetchedResults<Category>
    
    @State private var showingAddExpense = false
    @State private var showingAddCategory = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categorys) { category in
                    Text(category.name ?? "Unknown")
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


/* var body: some View {
 NavigationView {
 List {
 ForEach(items) { item in
 NavigationLink {
 ItemDetailView(item: item)
 } label: {
 HStack {
 VStack(alignment: .leading) {
 Text(item.category ?? "")
 .font(.headline)
 Text(item.type ?? "")
 }
 
 Spacer()
 
 Text(item.amount, format: .currency(code: "USD"))
 }
 }
 }
 .onDelete(perform: removeItems)
 }
 .navigationTitle("iWallet")
 .toolbar {
 Button {
 showingAddExpense = true
 } label: {
 Image(systemName: "plus")
 }
 }
 .sheet(isPresented: $showingAddExpense) {
 AddItems()
 }
 }
 }
 
 func removeItems(at offsets: IndexSet) {
 for offset in offsets {
 let item = items[offset]
 moc.delete(item)
 }
 }
 }
 */
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

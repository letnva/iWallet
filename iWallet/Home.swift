//
//  Home.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.note),
        SortDescriptor(\.type)
    ]) var items: FetchedResults<Item>
    
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.note ?? "")
                                .font(.headline)
                            Text(item.type ?? "")
                        }

                        Spacer()

                        Text(item.amount, format: .currency(code: "USD"))
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  ItemsView.swift
//  iWallet
//
//  Created by Владислав Новошинский on 15.03.2023.
//

import SwiftUI

struct ItemsView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var items: FetchedResults<Item>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(items) { item in
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
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}

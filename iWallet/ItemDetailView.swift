//
//  ItemDetailView.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    Text("Тип операции:")
                    Spacer()
                    Text(item.type ?? "")
                }
                HStack {
                    Text("Категория:")
                    Spacer()
                    Text(item.category ?? "")
                }
                HStack {
                    Text("Сумма:")
                    Spacer()
                    Text(String(item.amount))
                }
                HStack {
                    Text("Заметка:")
                    Spacer()
                    Text(item.note ?? "")
                }
            }
        }
        .navigationTitle(item.category ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Удалить операцию?", isPresented: $showingDeleteAlert) {
            Button("Удалить", role: .destructive, action: deleteItem)
            Button("Отмена", role: .cancel) { }
        } message: {
            Text("Вы уверены?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Удалить эту операцию", systemImage: "trash")
            }
        }
    }
    
    func deleteItem() {
        moc.delete(item)
        
        try? moc.save()
        dismiss()
    }
}


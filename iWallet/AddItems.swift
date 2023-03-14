//
//  AddItems.swift
//  iWallet
//
//  Created by Владислав Новошинский on 14.03.2023.
//

import SwiftUI

struct AddItems: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var note = ""
    @State private var type = "Расход"
    @State private var amount = 0.0

    let types = ["Расход", "Доход"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Заметка", text: $note)

                Picker("Тип", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)

                TextField("Сумма", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Добавьте операцию")
            .toolbar {
                Button("Сохранить") {
                    let item = Item(context: moc)
                    item.id = UUID()
                    item.note = note
                    item.amount = amount
                    item.type = type
                    
                    try? moc.save()
                    dismiss()
                }
            }
        }
    }
}

struct AddItems_Previews: PreviewProvider {
    static var previews: some View {
        AddItems()
    }
}
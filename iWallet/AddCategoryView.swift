//
//  AddCategoryView.swift
//  iWallet
//
//  Created by Владислав Новошинский on 15.03.2023.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var type = "Расход"
    @State private var name = ""
    
    let types = ["Расход", "Доход"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Тип", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Заметка", text: $name)

            }
            .navigationTitle("Добавьте категорию")
            .toolbar {
                Button("Сохранить") {
                    let category = Category(context: moc)
                    category.id = UUID()
                    category.type = type
                    category.name = name
                   
                    try? moc.save()
                    dismiss()
                }
            }
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}

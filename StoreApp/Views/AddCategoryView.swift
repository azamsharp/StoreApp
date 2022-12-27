//
//  AddCategoryView.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: StoreModel
    
    @State private var name: String = ""
    @State private var imageUrl: String = ""
  
    private var isFormValid: Bool {
        !name.isEmpty && !imageUrl.isEmpty // add a check for format of image url
    }
    
    private func saveCategory() async {
        
        guard let imageURL = URL(string: imageUrl) else {
            return
        }
        
        let category = Category(name: name, image: imageURL)
        do {
            try await model.saveCategory(category: category)
            dismiss() 
        } catch {
            // DISPLAY ERROR ON UI LATER...
            print(error)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter name", text: $name)
                TextField("Enter image url", text: $imageUrl)
            }.navigationTitle("Add Category")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            
                            Task {
                                await saveCategory()
                            }
                            
                        }.disabled(!isFormValid)
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

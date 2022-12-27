//
//  ContentView.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: StoreModel
    
    var body: some View {
        NavigationStack {
            List(model.categories) { category in
                HStack {
                    AsyncImage(url: category.image) { image in
                        image.resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(category.name)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category") {
                        isPresented = true
                    }
                }
            })
            .sheet(isPresented: $isPresented, content: {
                AddCategoryView()
            })
            .task {
                do {
                    try await model.populateCategories()
                } catch {
                    // WE WILL LOOK AT THE ERRORS AND DISPLAYING ERRORS IN LATER VIDEO
                    print(error)
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StoreModel())
    }
}

//
//  StoreModel.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import Foundation

// AGGREGATE MODEL
@MainActor
class StoreModel: ObservableObject {
    
    let webservice = Webservice()
    @Published var categories: [Category] = []
    
    func populateCategories() async throws {
        categories = try await webservice.getCategories()
    }
    
    func saveCategory(category: Category) async throws {
        let category = try await webservice.saveCategory(category: category)
        categories.append(category)
    }
    
}

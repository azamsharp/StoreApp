//
//  Webservice.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
// MV PATTERN

import Foundation

enum NetworkError: Error {
    case invalidServerResponse
    case decodingError
}

class Webservice {
    
    func saveCategory(category: Category) async throws -> Category {
        
        // WE WILL FIX IT IN THE LATER VIDEO
        let url = URL(string: "https://api.escuelajs.co/api/v1/categories/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(category)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 201 else {
            throw NetworkError.invalidServerResponse
        }
        
        guard let category = try? JSONDecoder().decode(Category.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return category 
    }
    
    func getCategories() async throws -> [Category] {
        
        // WE WILL FIX IT IN THE LATER VIDEO
        let url = URL(string: "https://api.escuelajs.co/api/v1/categories")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return categories
    }
    
}

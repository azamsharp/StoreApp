//
//  Category.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import Foundation

struct Category: Codable, Identifiable {
    var id: Int?
    let name: String
    let image: URL
}

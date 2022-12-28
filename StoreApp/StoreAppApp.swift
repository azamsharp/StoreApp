//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import SwiftUI

@main
struct StoreAppApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}

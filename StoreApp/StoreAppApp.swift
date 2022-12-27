//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Mohammad Azam on 12/27/22.
//

import SwiftUI

@main
struct StoreAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(StoreModel())
        }
    }
}

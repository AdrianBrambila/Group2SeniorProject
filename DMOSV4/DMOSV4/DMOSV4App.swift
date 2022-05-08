//
//  DMOSV4App.swift
//  DMOSV4
//
//  Created by Adrian Brambila on 4/26/22.
//

import SwiftUI

@main
struct DMOSV4App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
            HomeView()
            }
            .environmentObject(listViewModel)
        }
    }
}

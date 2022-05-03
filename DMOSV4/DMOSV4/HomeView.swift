//
//  HomeView.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/3/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome Back")
                NavigationLink(destination: ContentView()){
                    Text("Please Click to Continue")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

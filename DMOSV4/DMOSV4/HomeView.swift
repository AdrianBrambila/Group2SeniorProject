//
//  HomeView.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/3/22.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    var body: some View {
        NavigationView{
            
            GeometryReader{geo in
                ZStack{
                    
                    Image("Image")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                
                    VStack{
                        Label("Welcome Back!"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"")
                            .foregroundColor(Color.white)
                            .font(.title)
                        
                        Spacer()
                        NavigationLink(destination: ContentView()){
                            Text("Please Click to Continue")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color.white)
                            
                        }
                        
                    }
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

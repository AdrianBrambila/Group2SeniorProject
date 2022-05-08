//
//  ContentView.swift
//  DrugReminder
//
//  Created by Anh Nguyen on 8/30/21.
//

import SwiftUI

struct ContentView: View {
    @State private var   = false
    @State private var texts:[ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                })
                        }
                    }
                }
                else{
                    Text("No scan yet").font(.title)
                }
            }
            .navigationTitle("DMOS")
            .navigationBarItems(trailing: Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    Image(systemName: "camera")
                        .font(.title)
                    })
                .sheet(isPresented: $showScannerSheet, content: {
                    self.makeScannerView()
                })
            )
            .navigationBarItems(trailing: Button(action:{},
                                                 label:{
                Image(systemName: "calendar").font(.title)
            }))
        }
    }
    
    
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ListView.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/7/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var recognizedText = "Tap button to start scanning"
    @State private var showingScanningView = false
    
    
    var body: some View {
        padding()
        List{
                ForEach(listViewModel.items){ item in
                    RowView(item: item)
                }.onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
            }
            
            VStack {}
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.gray.opacity(0.5))
                    
                    Text(recognizedText)
                        .padding()
                }
                .padding()
            }
            
            // Spacer()
            HStack {
                Spacer()
                
                
                Button(action: {
                    self.showingScanningView = true
                }) {
                    Text("Start Scanning")
                }
                .padding()
                .foregroundColor(.white)
                .background(Capsule().fill(Color.blue))
            }
            .padding()
            
            .navigationTitle("Medication List")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: MedicationAddViewController()))
            .navigationBarBackButtonHidden(true)
            
            .sheet(isPresented: $showingScanningView) {
                ScanTextView(recognizedText: self.$recognizedText)
            }
    }
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


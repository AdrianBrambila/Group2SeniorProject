//
//  ContentView.swift
//  DMOSV4
//
//  Created by Adrian Brambila on 4/26/22.
//
import SwiftUI
import Combine



struct ContentView: View {
    
    
    
    @State private var recognizedText = "Tap button to start scanning"
    @State private var showingScanningView = false
    
    //@State private var meds: Array = []
    //@ObservedObject var meds: Meds()
    
    
    @ObservedObject var itemStore = ItemStore()
    @State var newItem : String = ""
    
    var searchBar : some View{
        HStack{
            // TextField("New Medication", text: self.$newItem)
            Spacer()
            NavigationLink(destination: MedicationAddViewController()) {
                Text("Add New")
            }
            //            Button(action: self.addNewItem, label: {
            //                Text("Add New")
            //            })
        }
    }
    
    func addNewItem(){
        itemStore.item.append(Item(id: String(itemStore.item.count + 1), listItem: newItem))
        self.newItem = ""
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.teal)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color.white)
                    .rotationEffect(Angle(degrees:45))
                    .edgesIgnoringSafeArea(.all)
                    
            VStack{
                searchBar.padding()
                List{
                    ForEach(self.itemStore.item){ item in
                        Text(item.listItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }
                
                //This displays the scanned text on the main page
                VStack {}
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                        
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
            }
            .navigationBarTitle("DMOS Scanner")
            .navigationBarHidden(true)
            .sheet(isPresented: $showingScanningView) {
                ScanTextView(recognizedText: self.$recognizedText)
            }
        }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func move(from source: IndexSet, to destination : Int) {
        itemStore.item.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet){
        itemStore.item.remove(atOffsets: offsets)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

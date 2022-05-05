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
    
    @State private var testArray = ""
    
    @ObservedObject var medStore = MedStore()

    
    @ObservedObject var itemStore = ItemStore()
    @State var newItem : String = ""
    
    var searchBar : some View{
        HStack{
           //TextField("New Medication", text: self.$newItem)
            Spacer()
            NavigationLink(destination: MedicationAddViewController()) {
               Text("Add New")
              //  meds.append(contentsOf: )
            }

            //Button(action: self.addNewItem, label: {
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
            VStack{
                searchBar.padding()
                List{
                    ForEach(self.medStore.med){ med in
                        Text(med.listMed)
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
                Text(recognizedText)

                .padding()
            }
            .navigationBarTitle("DMOS Scanner")
            .sheet(isPresented: $showingScanningView) {
                ScanTextView(recognizedText: self.$recognizedText)
            }

            }
    }
                
    func move(from source: IndexSet, to destination : Int) {
        medStore.med.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet){
        medStore.med.remove(atOffsets: offsets)
    }
    
    }

//class Meds: ObservableObject {
//    @Published var meds = [String]()
//
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

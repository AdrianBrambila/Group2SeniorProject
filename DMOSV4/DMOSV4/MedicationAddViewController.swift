//
//  MedicationAddViewController.swift
//  DMOSV4
//
//  Created by Adrian Brambila on 5/3/22.
//

import Foundation
import SwiftUI
import Combine

struct MedicationAddViewController: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var recognizedText = "Tap button to start scanning"
    @State var newMed : String = ""
    @State var newDose : String = ""
    @State var newInstruction : String = ""
    
    @ObservedObject var medStore = MedStore()
    
    
    
  /*  func addNewMeds(){
        medStore.med.append(Meds(id: String(medStore.med.count + 1), listMed: newMed))
        self.newMed = ""
    }*/
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.teal)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees:45))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Spacer()
                    TextField("Medication", text: self.$newMed)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.6))
                    Spacer()
                    TextField("Dosage", text: self.$newDose)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.6))
                    Spacer()
                    TextField("Instructions", text: self.$newInstruction)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.6))
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        ForEach(self.medStore.med) { med in
                            Text(med.listMed)
                        }
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                           // self.addNewMeds()
                        })
                        {
                            Text("Add New")
                        }
                        .padding()
                        .padding()
                        
                    }
                    
                }
                
                //.navigationBarTitle("Enter Medication")
                
            }
        }
        
    }
}
//struct medInfo {
//    var newMed: String
//    var newDose: String
//    var newInstruction: String
//}

struct MedicationAdd_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MedicationAddViewController()
        }
    }
}



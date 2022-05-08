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
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var recognizedText = "Tap button to start scanning"
    @State var newMed : String = ""
    @State var newDose : String = ""
    @State var newInstruction : String = ""
    @State var textFieldText: String = ""
    
    @ObservedObject var medStore = MedStore()
    
    
    
  /*  func addNewMeds(){
        medStore.med.append(Meds(id: String(medStore.med.count + 1), listMed: newMed))
        self.newMed = ""
    }*/
    
    
    var body: some View {
        NavigationView {
          //  ZStack{
              /*  Rectangle()
                    .foregroundColor(Color.teal)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees:45))
                    .edgesIgnoringSafeArea(.all)*/
                VStack{
                    TextField("Medication", text: $newMed)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.1))
                        .frame(height: 55)
                        .cornerRadius(10)
                    Spacer()
                    TextField("Dosage", text: $newDose)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.1))
                        .frame(height: 55)
                        .cornerRadius(10)
                    Spacer()
                    TextField("Instructions", text: $newInstruction)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.gray
                                        .opacity(0.1))
                        .frame(height: 55)
                        .cornerRadius(10)
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        ForEach(self.medStore.med) { med in
                            Text(med.listMed)
                        }
                        
                        Button(action: saveButton, label:
                        {
                            Text("Save")
                                .foregroundColor(Color.blue)
                        })
                        .padding()
                        .padding()
                        
                    }
                    
                }
                
                //.navigationBarTitle("Enter Medication")
            }
        }
        
   // }
    func saveButton(){
        listViewModel.add(title: newMed)
        presentationMode.wrappedValue.dismiss()
    }
}
//struct medInfo {
//    var newMed: String
//    var newDose: String
//    var newInstruction: String
//}


struct MedicationAdd_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MedicationAddViewController()
        }
        .environmentObject(ListViewModel())
    }
}



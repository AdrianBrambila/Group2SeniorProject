//
//  ListView.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/7/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    
    var body: some View {

        List{
            ForEach(listViewModel.items){ item in
                RowView(item: item)
            }.onDelete(perform: listViewModel.delete)
                .onMove(perform: listViewModel.move)
        }
        .navigationTitle("Medication List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: MedicationAddViewController()))
        .navigationBarBackButtonHidden(true)
    
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


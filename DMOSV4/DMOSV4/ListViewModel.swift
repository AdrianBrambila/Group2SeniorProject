//
//  ListViewModel.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/8/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [MedsModel] = []
    
    init(){
        getItems()
    }
    func getItems(){
        
        let newItems = [
            MedsModel(title: "1"), MedsModel(title: "2"),]
        
        items.append(contentsOf: newItems)
        
    }
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func add(title: String){
        let newItem = MedsModel(title: title)
        items.append(newItem)
    }

}

//
//  Data.swift
//  DMOSV4
//
//  Created by Adrian Brambila on 5/2/22.
//

import Foundation
import SwiftUI
import Combine

struct Item : Identifiable{
    var id = String()
    var listItem = String()
    
    
}

class ItemStore: ObservableObject{
    @Published var item = [Item]()
    
}


struct Meds : Identifiable{
    var id = "Benadryl"
    var listMed = String()
    
    
}

class MedStore: ObservableObject{
    @Published var med = [Meds]()
    
}



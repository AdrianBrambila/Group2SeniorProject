//
//  ScanData.swift
//  DrugReminder
//
//  Created by Anh Nguyen on 2/15/22.
//

import Foundation

struct ScanData:Identifiable{
    var id = UUID()
    let content:String
    
    init(content:String){
        self.content = content
    }
}

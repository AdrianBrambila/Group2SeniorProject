//
//  RowView.swift
//  DMOSV4
//
//  Created by Aaron Yu on 5/7/22.
//

import SwiftUI

struct RowView: View {
    
    let item: MedsModel
    
    var body: some View {
        HStack{
            Text(item.title)
            Spacer()
        }
    }
}
struct RowView_Previews: PreviewProvider {
    
    static var item1 = MedsModel(title: "test test test")
    static var previews: some View {
        RowView(item: item1)
    }
}

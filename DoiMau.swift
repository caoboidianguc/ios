//
//  DoiMau.swift
//  DoCanMua
//
//  Created by Quang Vu on 10/26/21.
// just practice on swiftui

import SwiftUI

struct DoiMau: View {
    var muc: DanhMucCanMua
    @Binding var nut: Bool
    
    
    var body: some View {
        Button (action: {
            nut.toggle()
        }, label: {
            if (muc.uuTien) {
                HStack {
                    Text(muc.muc)
                    Spacer()
                    Image(systemName: "cart")}
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.green)
                        .font(.title)
                    
        } else {
            Text(muc.muc)
                .foregroundColor((.secondary))
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
        })
      
    }
}

struct DoiMau_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DoiMau(muc: DanhMucCanMua.mauthu[0], nut: .constant(true)).previewLayout(.fixed(width: 300, height: 60))
            DoiMau(muc: DanhMucCanMua.mauthu[3], nut: .constant(false)).previewLayout(.fixed(width: 300, height: 60))
        }
    }
}

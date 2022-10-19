//
//  KhachRow.swift
//  Ledger
//
//  Created by Thong Vu on 10/12/22.
//

import SwiftUI

struct KhachRow: View {
    var khach: Khach
    var body: some View {
        HStack {
            Text(khach.name)
            Spacer()
            Text(khach.sdt)
        }.padding(10)
    }
}

struct KhachRow_Previews: PreviewProvider {
    static var previews: some View {
        KhachRow(khach: khachmau[0]).previewLayout(.fixed(width: 300, height: 50))
    }
}

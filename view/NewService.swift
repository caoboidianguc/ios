//
//  NewService.swift
//  Ledger
//
//  Created by Thong Vu on 10/19/22.
//

import SwiftUI

struct NewService: View {
    @Binding var newSer: Service.themDv
    var body: some View {
        VStack {
            TextField("SerVice" , text: $newSer.dichVu)
            TextField("Price" , value: $newSer.gia, formatter: NumberFormatter())
        }.padding()
            .onAppear{
                newSer.dichVu.removeAll()
                newSer.gia = 0
            }
    }
}

struct NewService_Previews: PreviewProvider {
    static var previews: some View {
        NewService(newSer: .constant(Service.themDv()))
    }
}

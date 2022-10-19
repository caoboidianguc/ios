//
//  ClientDetail.swift
//  Ledger
//
//  Created by Thong Vu on 10/12/22.
//

import SwiftUI

struct ClientDetail: View {
    var khach: Khach
    
    var body: some View {
        List {
            Section(header: Text("Client:")) {
                HStack {
                    Text(khach.name)
                    Spacer()
                    Text(khach.sdt)
                }
            }.padding(8)
            Section(header: Text("Service:")) {
                ForEach(khach.dvDone){dv in
                    HStack {
                        Text(dv.dichVu)
                        Spacer()
                        Text("$\(dv.gia)")
                    }
                }
            }
           
            Section(header: Text("Detail")){
                Text("Last Done: \(khach.ngay.formatted(.dateTime))")
                Text("Note: \(khach.desc)")
                Text("Total:")
            }
        }.navigationTitle(Text("\(khach.name) visited"))
    }//body
    
}

struct ClientDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClientDetail(khach: khachmau[0])
        }
    }
}

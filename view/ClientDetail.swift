//
//  ClientDetail.swift
//  Ledger
//
//  Created by Thong Vu on 10/12/22.
//

import SwiftUI

struct ClientDetail: View {
    @StateObject var worker = KhachData()
    @Binding var khach: Khach
    @State private var updateKhach: Khach.ThemKhach = Khach.ThemKhach()
    @State private var suadoi = false
    
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
                Text("Time visited: \(khach.diem)")
                Text("Total: $\(khach.khachTra())")
            }
        }.navigationTitle(Text("\(khach.name) visited"))
            .navigationBarItems(trailing: Button("Edit"){
                suadoi = true
                updateKhach = khach.mau
            })
            .fullScreenCover(isPresented: $suadoi) {
                NavigationView {
                    ClientEdit(client: $updateKhach)
                        .environmentObject(self.worker)
                        .navigationBarItems(leading: Button("Huy"){
                            suadoi = false
                        }, trailing: Button("Update"){
                            if khach.dvDone.isEmpty {
                                khach.update(tu: updateKhach)
                            } else {
                                khach.updateDiem(tu: updateKhach)
                            }
                            
                            suadoi = false
                        })
                }
            }
    }//body
    
}

struct ClientDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClientDetail(khach: .constant(khachmau[0]))
                .environmentObject(KhachData())
        }
    }
}

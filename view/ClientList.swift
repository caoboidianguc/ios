//
//  ClientList.swift
//  Ledger
//
//  Created by Thong Vu on 10/12/22.
//

import SwiftUI

struct ClientList: View {
    //@Binding var worker: Technician
    @Binding var khachs: [Khach]
    @State var newCus = Khach.ThemKhach()
    @State private var trangMoi = false
    @Environment(\.scenePhase) private var scene
    let luuThayDoi: () -> Void
    
    var body: some View {
        List {
            ForEach(khachs) { khach in
                NavigationLink(destination: ClientDetail(khach: khach)){
                    KhachRow(khach: khach)
                }
            }.onDelete{ khach in
                withAnimation{
                    khachs.remove(atOffsets: khach)
                }
            }
        }//list
        .navigationTitle("My Clients")
        .navigationViewStyle(.automatic)
        .navigationBarItems(trailing: Button(action: {trangMoi = true },
                                             label: {Image(systemName: "plus")}))
        .sheet(isPresented: $trangMoi) {
            NavigationView {
                ClientEdit(client: $newCus)
                    .navigationBarItems(leading: Button("Cancel"){
                        trangMoi = false
                    }, trailing: Button("Add"){
                        let newClient = Khach(name: newCus.name, sdt: newCus.sdt, desc: newCus.desc ,dvDone: newCus.dvDone)
                        khachs.append(newClient)
                        trangMoi = false
                    })
            }
        }
        .onChange(of: scene){ phase in
            if phase == .inactive {
                luuThayDoi()
            }
        }
    }//body
}

struct ClientList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClientList(khachs: .constant(khachmau), luuThayDoi: {})
        }
    }
}

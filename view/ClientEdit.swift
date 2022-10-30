//
//  ClientEdit.swift
//  Ledger
//
//  Created by Thong Vu on 10/13/22.
//

import SwiftUI

struct ClientEdit: View {
    @EnvironmentObject var worker: KhachData
    @Binding var client: Khach.ThemKhach
    @State var newSer = Service.themDv()
    var cotGrid: [GridItem] = [GridItem(spacing:5, alignment: .center),
                               GridItem(spacing:5, alignment: .center),
                               GridItem(spacing:5, alignment: .center)]
    var dichvu: [String] {
        var ds: [String] = []
        for ser in client.dvDone {
            ds.append(ser.dichVu)
        }
        return ds
    }
    var danhmuc: String {
        ListFormatter.localizedString(byJoining: dichvu)
    }
   
    var body: some View {
        ScrollView {
            VStack {
                TextField("Name:", text: $client.name)
                TextField("phone", text: $client.sdt)
                TextField("Note:", text: $client.desc)
                Text(danhmuc)
            }.padding()
            
            LazyVGrid (columns: cotGrid,alignment: .center, spacing: 5, content: {
                ForEach(worker.khach.services){ serv in
                    Button(action: {
                        client.dvDone.append(serv)
                    }, label: {
                        VStack {
                        Text(serv.dichVu)
                        Text("$\(serv.gia)")
                        }.padding()
                                
                    })
                }
            })
            HStack {
                NewService(newSer: $newSer)
                Button("Add Service", action: {
                    let new = Service(dichVu: newSer.dichVu, gia: newSer.gia)
                    self.worker.khach.services.append(new)
                }).disabled(newSer.dichVu.isEmpty)
            }
        }//list
        
        
        .onAppear{
            client.dvDone.removeAll()
            
        }
    }//body
    
}

struct ClientEdit_Previews: PreviewProvider {
    
    static var previews: some View {
        ClientEdit(client: .constant(khachmau[0].mau))
            .environmentObject(KhachData())
    }
}

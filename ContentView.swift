//
//  ContentView.swift
//  DoCanMua
//
//  Created by Quang Vu on 10/23/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var danhMucCanMua: [DanhMucCanMua]
    @State private var doiNut = false
    @State private var canmua = ""
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
   
    
        var body: some View {
            
            List {
                ForEach($danhMucCanMua) { $item in
                    DoiMau(muc: item, nut: $item.uuTien)
                }
                .onMove(perform: move)
                .onDelete {xoa in
                    withAnimation {
                        danhMucCanMua.remove(atOffsets: xoa)
                    }
                }
                HStack {
                    TextField("Them", text: $canmua)
                    Button(action: {
                        let mucmoi = DanhMucCanMua(muc: canmua, uuTien: true)
                        danhMucCanMua.insert(mucmoi, at: 0)
                        canmua = ""}) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                            
                            }.disabled(canmua.isEmpty)
                    }
            }
            .navigationTitle("Cần - Needed")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing: EditButton())
            
            .onChange(of: scenePhase) {
                phase in
                if phase == .inactive {
                    saveAction()
                }
            }
            
    }
    //het body
//    func xoa(at offset: IndexSet){
//        danhMucCanMua.remove(atOffsets: offset)
//    }
    
    func move(from source: IndexSet, to des: Int){
        danhMucCanMua.move(fromOffsets: source, toOffset: des)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(danhMucCanMua: .constant(DanhMucCanMua.mauthu), saveAction: {})
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


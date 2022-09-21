//
//  DuLieuMua.swift
//  DoCanMua
//
//  Created by Quang Vu on 10/23/21.
//

import Foundation




class DuLieuMua: ObservableObject {
    
    private static var documentsFolder: URL {
        do{
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("khong tim thay duong dan")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("muaDo.data")
    }
    
    
    @Published var data: [DanhMucCanMua] = []
    
    
    
    func load() {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let dulieu = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.data = DanhMucCanMua.mauthu
                }
                #endif
                return
            }
            guard let taiTapTin = try?
                    JSONDecoder().decode([DanhMucCanMua].self, from: dulieu) else {
                        fatalError("khong the giai ma tap tin")
                    }
            DispatchQueue.main.async {
                self?.data = taiTapTin
            }
        }
    }
    
    func save(){
        DispatchQueue.global().async {
            [weak self] in
            guard let laydulieu = self?.data else {fatalError("khong the luu tap tin")}
            
            guard let dulieu = try? JSONEncoder().encode(laydulieu) else {
                fatalError("khong the ma hoa tap tin")
            }
            do {
                let outfile = Self.fileURL
                try dulieu.write(to: outfile)
            } catch {
                fatalError("khong the ghi tap tin")
            }
        }
    }
    
}

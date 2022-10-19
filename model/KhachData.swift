//
//  KhachData.swift
//  Ledger
//
//  Created by Thong Vu on 7/18/22.
//

import Foundation


class KhachData: ObservableObject {
    private static var documentFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("khong thay duong dan thu muc.")
        }
    }
    
    private static var fileURL: URL {
        return documentFolder.appendingPathComponent("khach.data")
    }
    
    @Published var khachData: [Khach] = []
    //@Published var worker: Technician = quang
    
    
    
    
    
    
    func load(){
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.khachData = khachmau
                }
                #endif
                return
            }
            guard let nguoiMoi = try? JSONDecoder().decode([Khach].self, from: data) else {
                fatalError("khong the decode")
            }
            DispatchQueue.main.async {
                self?.khachData = nguoiMoi
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let ngaycong = self?.khachData else {fatalError("khong the luu")}
            guard let data = try? JSONEncoder().encode(ngaycong) else {fatalError("khong the encode")}
            
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("khong the ghi vao tap tin")
            }
        }
    }
}

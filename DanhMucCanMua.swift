//
//  DanhMucCanMua.swift
//  DoCanMua
//
//  Created by Quang Vu on 10/23/21.
//

import Foundation

struct DanhMucCanMua: Codable , Identifiable {
    var id: UUID = UUID()
    var muc: String
    var uuTien: Bool

    init (id: UUID = UUID(), muc: String, uuTien: Bool){
        self.muc = muc
        self.uuTien = uuTien
    }
}

extension DanhMucCanMua {
    static var mauthu: [DanhMucCanMua] {
        [DanhMucCanMua(muc:"chuoi", uuTien: true),
        DanhMucCanMua(muc: "Chanh", uuTien: true),
         DanhMucCanMua(muc:"trung", uuTien: true),
         DanhMucCanMua(muc: "dua leo", uuTien: false),
         DanhMucCanMua(muc:"duong", uuTien: false),
         DanhMucCanMua(muc: "sua", uuTien: false)]
    }
}


//
//  Service.swift
//  Ledger
//
//  Created by Thong Vu on 5/11/22.
//

import Foundation



struct Service: Codable, Identifiable {
    var id: UUID
    var dichVu: String
    var gia: Int
    init(id: UUID = UUID(), dichVu: String, gia: Int){
        self.id = id
        self.dichVu = dichVu
        self.gia = gia
    }
}



extension Service {
    struct themDv {
        var dichVu: String = ""
        var gia: Int = 0
    }
}

//
//  Technician.swift
//  Ledger
//
//  Created by Thong Vu on 7/20/22.
//

import Foundation


struct Technician: Codable {
    let name: String
    var services: [Service]
    var khach: [Khach]
    init(name: String, services:[Service] = [] , khach:[Khach] = []){
        self.name = name
        self.services = services
        self.khach = khach
    }
}
let quang = Technician(name: "Quang", khach: khachmau)


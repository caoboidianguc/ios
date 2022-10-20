//
//  Khach.swift
//  Ledger
//
//  Created by Thong Vu on 5/11/22.
//

import Foundation


struct Khach: Codable, Identifiable {
    var id: UUID
    var name: String
    var sdt: String
    var desc: String
    var diem: Int = 1
    var dvDone: [Service] = []
    var services: [Service]
    var ngay: Date
    
    init(id: UUID = UUID(),name: String, sdt: String, desc: String = "", dvDone: [Service] = [], services: [Service] = dvmau, ngay: Date = Date()){
        self.id = id
        self.name = name
        self.sdt = sdt
        self.desc = desc
        self.dvDone = dvDone
        self.services = services
        self.ngay = ngay
    }
    
    func khachTra() -> Int {
        var tongChi = 0
        for dvu in self.dvDone {
            tongChi += dvu.gia
        }
        return tongChi
    }
}

let khachmau = [Khach(name: "hibi", sdt: "7642",dvDone:[Service(dichVu: "Full", gia: 50)]),
                Khach(name: "Jubi", sdt: "8775", dvDone:[Service(dichVu: "talk", gia: 60)]),
                Khach(name: "Linh", sdt: "8775", dvDone:[Service(dichVu: "read", gia: 70)]),
                Khach(name: "Quang", sdt: "9070", dvDone:[Service(dichVu: "gaming", gia: 40)])]

extension Khach {
    struct ThemKhach {
        var name: String = ""
        var sdt: String = ""
        var desc: String = ""
        var dvDone: [Service] = []
        var services: [Service] = dvmau
        var diem: Int = 1
        var ngay: Date = Date()
    }
    //mau: ThemKhach la de khi update custommer, load this
    var mau: ThemKhach {
        return ThemKhach(name: name, sdt: sdt, desc: desc, dvDone: dvDone, services: services, diem: diem, ngay: ngay)
        
    }
    
    static var dvmau = [Service(dichVu: "Full set", gia: 60),
                        Service(dichVu: "GelPed", gia: 60),
                        Service(dichVu: "Combo Gel", gia: 105),
                        Service(dichVu: "Fill in", gia: 50),
                        Service(dichVu: "Pedicure", gia: 45),
                        Service(dichVu: "Gel mani", gia: 45),
                        Service(dichVu: "Gel Add", gia: 15),
                        Service(dichVu: "Combo Reg", gia: 70),
                        Service(dichVu: "Nature Retreat", gia: 55),
                        Service(dichVu: "Brisa Detox", gia: 70),
                        Service(dichVu: "Ultimate", gia: 90),
                        Service(dichVu: "Dip", gia: 50),
                        Service(dichVu: "Ombre", gia: 70),
                        Service(dichVu: "french", gia: 5),
                        Service(dichVu: "Nail-Shape", gia: 10)]
    
    mutating func update(tu data: ThemKhach){
        name = data.name
        sdt = data.sdt
        desc = data.desc
        dvDone = data.dvDone
        services = data.services
        diem = data.diem + 1
        ngay = Date()
    }
}

//
//  KhachData.swift
//  Ledger
//
//  Created by Thong Vu on 7/18/22.
//
import Foundation


class KhachData: ObservableObject {
    @Published var khach: Technician = Technician(name: "Quang")
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("client.data")
    }
    
    
    
    static func load(completion: @escaping (Result<Technician, Error>) -> Void){
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success(quang))
                    }
                    return
                }
                let khach = try JSONDecoder().decode(Technician.self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(khach))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(khach: Technician, completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(khach)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(1))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func delete(_ client: Khach){
        khach.khach.removeAll { $0.id == client.id }
    }
    
    func daDen(_ client: Khach) -> Bool {
        khach.khach.contains(client)
    }
    
}

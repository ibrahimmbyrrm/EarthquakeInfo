//
//  Depremdao.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 26.02.2023.
//

import Foundation

struct Depremdao {
    let db : FMDatabase?
    
    init() {
        let hedefyol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: hedefyol).appendingPathComponent("illerDeprem.db")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func verileriAl() -> [Provinces] {
        var liste = [Provinces]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM iller", values: nil)
            
            while(rs.next()) {
                let province = Provinces(sehir: rs.string(forColumn: "sehir")!, risk: rs.string(forColumn: "risk")!)
                liste.append(province)
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
    
}

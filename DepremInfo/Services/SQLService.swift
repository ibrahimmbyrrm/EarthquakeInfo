//
//  SQLService.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 26.02.2023.
//

import Foundation

struct SQLService {

    func copyDatabase() {
        let bundleYolu = Bundle.main.path(forResource: "illerDeprem", ofType: ".db")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("illerDeprem.db")
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı zaten mecvut")
        }else {
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                print("kopyalandi")
            }catch {
                print(error)
            }
        }
    }
}

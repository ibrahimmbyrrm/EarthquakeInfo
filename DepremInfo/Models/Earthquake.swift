//
//  Earthquake.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation

struct KandilliData : Codable {
    let status : Bool
    let httpStatus, serverloadms : Int
    let desc : String
    let metadata : Metadata
    let result : [Result]
}


struct Metadata : Codable {
    let total : Int
}


struct Result : Codable {
    let earthquake_id, title, date, lokasyon : String
    let lat, lng, mag, depth : Double
    let coordinates : [Double]
}

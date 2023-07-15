//
//  Earthquake.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation
/*
 struct KandilliData : Codable {
     let status : Bool
     let metadata : Metadata
     let result : [Result]
 }
 
 struct Metadata : Codable {
     let total : Int
 }
 
 
 struct Result : Codable {
     let earthquake_id, title, date: String
     let mag, depth : Double
 
 }
*/
struct KandilliData: Codable {
    let status: Bool
       let httpStatus, serverloadms: Int
       let desc: String
       let metadata: Metadata
       let result: [Result]
}

// MARK: - Metadata
struct Metadata: Codable {
    let dateStarts, dateEnds: String
       let total: Int

       enum CodingKeys: String, CodingKey {
           case dateStarts = "date_starts"
           case dateEnds = "date_ends"
           case total
       }
}

// MARK: - Result
struct Result: Codable {
    let id, earthquakeID: String
    let provider: Provider
    let title, date: String
    let mag, depth: Double
    let geojson: Geojson
    let locationProperties: LocationProperties
    let rev: String?
    let dateTime: String
    let createdAt: Int
    let locationTz: LocationTz

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case earthquakeID = "earthquake_id"
        case provider, title, date, mag, depth, geojson
        case locationProperties = "location_properties"
        case rev
        case dateTime = "date_time"
        case createdAt = "created_at"
        case locationTz = "location_tz"
    }
}

// MARK: - Geojson
struct Geojson: Codable {
    let type: TypeEnum
    let coordinates: [Double]
}

enum TypeEnum: String, Codable {
    case point = "Point"
}

// MARK: - LocationProperties
struct LocationProperties: Codable {
    let closestCity, epiCenter: ClosestCity
    let closestCities: [ClosestCity]
    let airports: [Airport]
}

// MARK: - Airport
struct Airport: Codable {
    let distance: Double
    let name, code: String
    let coordinates: Geojson
}

// MARK: - ClosestCity
struct ClosestCity: Codable {
    let name: String
    let cityCode: Int
    let distance: Double?
    let population: Int?
}

enum LocationTz: String, Codable {
    case europeIstanbul = "Europe/Istanbul"
}

enum Provider: String, Codable {
    case kandilli = "kandilli"
}
 

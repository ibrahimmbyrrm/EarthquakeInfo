//
//  DetailViewModel.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 25.02.2023.
//

import Foundation
import UIKit


struct DetailViewModel {
    let selectedEQ : Result
    
    func updateLabels(date : UILabel, title : UILabel, latitude : UILabel, longitude : UILabel, magnitude : UILabel, depth : UILabel, id : UILabel) {
        date.text = "Tarih: \(selectedEQ.date)"
        title.text = selectedEQ.title
        latitude.text = "Enlem: \(selectedEQ.lat)"
        longitude.text = "Boylam: \(selectedEQ.lng)"
        magnitude.text = "Büyüklük: \(selectedEQ.mag)"
        depth.text = "Derinlik : \(selectedEQ.depth)"
        id.text = "Deprem ID : \(selectedEQ.earthquake_id)"
    }
}

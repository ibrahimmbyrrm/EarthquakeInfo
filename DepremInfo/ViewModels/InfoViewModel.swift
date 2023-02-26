//
//  InfoViewModel.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation
import UIKit

struct ProvinceListViewModel {
    let provinceList : [Provinces]
    
    func numberOfRowsInComponent() -> Int {
        return provinceList.count
    }
    func titleForRow(index : Int) -> String {
        return provinceList[index].sehir
    }
    func provinceForRow(_ index : Int) -> ProviceViewModel {
        let prov = provinceList[index]
        return ProviceViewModel(province: prov)
    }
    
}
struct ProviceViewModel {
    let province : Provinces
    
    var name : String {
        return province.sehir
    }
    var risk : String {
        return province.risk
    }
    
    func updateRiskLabel(label : UILabel) {
        label.text = province.risk
        if province.risk == "Çok yüksek" {
            label.backgroundColor = .red
        }else if province.risk == "Yüksek" {
            label.backgroundColor = .orange
        }else if province.risk == "Orta" {
            label.backgroundColor = .yellow
        }else if province.risk == "Az" || province.risk == "Çok az" {
            label.backgroundColor = .green
        }
    }
    
}

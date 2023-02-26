//
//  LiveViewModel.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation

struct LiveEartquakesViewModel {
    
    let earthquakeList : [Result]
    
    func numberOfRowsInSection() -> Int {
        return earthquakeList.count
    }
    
    func cellForRowAt(_ index : Int) -> EarthquakeViewModel {
        let earthquake = earthquakeList[index]
        return EarthquakeViewModel(earthquake: earthquake)
    }
    
    
}
struct EarthquakeViewModel {
    
    let earthquake : Result
    
    var title : String {
        return self.earthquake.title
    }
    
    var mag : Double {
        return self.earthquake.mag
    }
    
    var date : String {
        return self.earthquake.date
    }
    
    var depth : Double {
        return self.earthquake.depth
    }
}


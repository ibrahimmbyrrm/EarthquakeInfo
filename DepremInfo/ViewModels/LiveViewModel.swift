//
//  LiveViewModel.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import Foundation
import RxCocoa
import RxSwift

struct LiveEartquakesViewModel {
    
    let earthquakeList = PublishSubject<[Result]>()
    
    
    func fetch() {
        APIService().callAPI { result in
            switch result {
            case .success(let data):
                guard let data else {return}
                earthquakeList.onNext(data.result)
            case.failure(let error):
                print(error)
            }
        }
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


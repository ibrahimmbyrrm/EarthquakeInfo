//
//  ViewController.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//
import RxCocoa
import RxSwift
import UIKit

class InfoView: UIViewController{
    
    var ViewModel = ProvinceListViewModel()
    var bag = DisposeBag()
    
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var provincePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SQLService().copyDatabase()
        ViewModel.getData()
        
        ViewModel.provinceList
            .bind(to: provincePicker.rx.itemTitles) { row, item in
                return item.sehir
            }
            .disposed(by: bag)
        
        provincePicker.rx.modelSelected(Provinces.self)
            .subscribe(onNext: { [weak self] items in
                if let selectedProvince = items.first {
                    self?.riskLabel.text = "\(selectedProvince.risk)"
                } else {
                    self?.riskLabel.text = ""
                }
            })
            .disposed(by: bag)
        
        
        riskLabel.text = ""
        
        
        
    }
}



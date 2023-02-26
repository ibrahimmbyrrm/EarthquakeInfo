//
//  ViewController.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import UIKit

class InfoView: UIViewController{

    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var provincePicker: UIPickerView!
    var ViewModel : ProvinceListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        provincePicker.delegate = self
        provincePicker.dataSource = self
        riskLabel.text = ""
        self.ViewModel = ProvinceListViewModel(provinceList: Depremdao().verileriAl())
        SQLService().copyDatabase()
    }
   


}
extension InfoView : UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ViewModel.numberOfRowsInComponent()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let provViewModel = self.ViewModel.provinceForRow(row)
        return provViewModel.name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let provViewModel = self.ViewModel.provinceForRow(row)
        provViewModel.updateRiskLabel(label: self.riskLabel)
    }
    
    
    
    
    
}


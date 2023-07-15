//
//  DetailView.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 25.02.2023.
//

import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    var selectedModel : Result? {
        didSet {
            updateLabels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func updateLabels() {
        guard let selectedModel else {return}
        idLabel.text = selectedModel.id
        depthLabel.text = "Derinlik : \(selectedModel.depth)"
        magnitudeLabel.text = "Büyüklük : \(selectedModel.mag)"
        dateLabel.text = "Tarih : \(selectedModel.date)"
        locationLabel.text = "Konum : \(selectedModel.title)"
    }
    

}

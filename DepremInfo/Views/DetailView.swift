//
//  DetailView.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 25.02.2023.
//

import UIKit

class DetailView: UIViewController {
    var viewModel : DetailViewModel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateLabels(date: dateLabel, title: locationLabel, latitude: latLabel, longitude: longLabel, magnitude: magnitudeLabel, depth: depthLabel, id: idLabel)
        
    }
    

}

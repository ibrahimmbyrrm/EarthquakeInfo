//
//  TableViewCell.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 25.02.2023.
//

import UIKit

class LiveCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with eartquakeViewModel : EarthquakeViewModel) {
        dateLabel.text = eartquakeViewModel.date
        depthLabel.text = String(eartquakeViewModel.depth)
        magLabel.text = String(eartquakeViewModel.mag)
        titleLabel.text = eartquakeViewModel.title
        colorChanger(x: eartquakeViewModel.mag)
    }
    
    func colorChanger(x : Double) {
        if x < 4.00 {
            colorView.backgroundColor = .green
        }else if x < 6.00 {
            colorView.backgroundColor = .systemYellow
        }else {
            colorView.backgroundColor = .red
        }
    }

}

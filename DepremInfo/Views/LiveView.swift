//
//  LiveView.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import UIKit

class LiveView: UIViewController{
    
    var selectedEarthquake : Result?
    var viewModel : LiveEartquakesViewModel!
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()
    }
    
    func fetchData() {
        APIService().callAPI { result in
            switch result {
            case .success(let data):
                guard let data = data else {return}
                self.viewModel = LiveEartquakesViewModel(earthquakeList: data.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    

}
extension LiveView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel == nil {
            return 0
        }else {
            return viewModel.numberOfRowsInSection()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LiveCell
        let eartquakeViewModel = self.viewModel.cellForRowAt(indexPath.row)
        cell.dateLabel.text = eartquakeViewModel.date
        cell.depthLabel.text = String(eartquakeViewModel.depth)
        cell.magLabel.text = String(eartquakeViewModel.mag)
        cell.titleLabel.text = eartquakeViewModel.title
        cell.colorChanger(x: eartquakeViewModel.mag)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedEarthquake = self.viewModel.cellForRowAt(indexPath.row).earthquake
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailView
            destVC.viewModel = DetailViewModel(selectedEQ: self.selectedEarthquake!)
        }
    }
    
    
    
}

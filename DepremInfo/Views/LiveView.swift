//
//  LiveView.swift
//  DepremInfo
//
//  Created by İbrahim Bayram on 24.02.2023.
//

import UIKit
import RxCocoa
import RxSwift

class LiveView: UIViewController{
    
    var selected : Result?
    var viewModel = LiveEartquakesViewModel()
   
    @IBOutlet weak var tableView: UITableView!
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch()
        bindTableView()
        
    }
    
    private func bindTableView() {
        viewModel.earthquakeList
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: LiveCell.self)) { row,item,cell in
            let vm = EarthquakeViewModel(earthquake: item)
            cell.configure(with: vm)
        }.disposed(by: bag)
        
        tableView
            .rx
            .modelSelected(Result.self)
            .subscribe(onNext: { item in
                self.selected = item
                self.performSegue(withIdentifier: "toDetail", sender: nil)
        }).disposed(by: bag)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DetailView
        destVC.selectedModel = selected!
    }

    
}


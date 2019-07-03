//
//  ViewController.swift
//  MVVM
//
//  Created by Govindharaj Murugan on 7/03/19.
//  Copyright © 2019 Govindharaj Murugan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: RepoTableViewModel = {
        return RepoTableViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test()
        self.initVM()
    }
    
    func initVM() {
        viewModel.initFetch()
    }
    
    func test() {
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repoTableViewCell", for: indexPath) as? RepoTableViewCell else {
            fatalError("Cell does not exist in storyboard")
        }
        
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        
        cell.repoNameText.text = cellVM.name
        cell.repoDescText.text = cellVM.desc
        
        cell.repoCounterText.text = "Star: \(cellVM.starCount) Fork: \(cellVM.forkCount) URL: \(cellVM.url)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    
}



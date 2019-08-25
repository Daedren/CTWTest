//
//  LocationListViewController.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay

class LocationListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: LocationListPresenter!
    
    var searchedText = PublishRelay<String?>()
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configurePresenter()
    }
    
    func configureView() {
        // MARK: TableView
        self.tableView.register(UINib(resource: R.nib.locationTableViewCell),
                                forCellReuseIdentifier: LocationTableViewCell.reuseIdentifier)

        // MARK: Navigation
        self.navigationController?.navigationItem.title = R.string.localizable.location_title()
        
        // MARK: Search
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = R.string.localizable.location_search_placeholder()
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func configurePresenter() {
        let result = presenter.configure(searchText: self.searchedText.distinctUntilChanged().asObservable(),
                                         disposeBag: self.disposeBag)
        
        result
            .drive(tableView.rx.items(cellIdentifier: LocationTableViewCell.reuseIdentifier, cellType: LocationTableViewCell.self)) { _, element, cell in
                cell.configure(from: element)
            }
            .disposed(by: self.disposeBag)

        //        result.drive(onNext: { cells in
        //
        //        }).disposed(by: self.disposeBag)
    }
    
}

extension LocationListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.searchedText.accept(searchController.searchBar.text)
    }
}

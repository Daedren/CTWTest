//
//  LocationDetailViewController.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import MapKit

class LocationDetailViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    var presenter: LocationDetailPresenter!
    
    override func viewDidLoad() {
        configureView()
        configurePresenter()
    }
    
    func configureView() {
        self.tableView.register(UINib(resource: R.nib.titleSubtitleTableViewCell), forCellReuseIdentifier: TitleSubtitleTableViewCell.reuseIdentifier)
    }
    
    func configurePresenter() {
        let result = self.presenter.configure(disposeBag: self.disposeBag)
        
        result.cells
            .drive(tableView.rx.items(cellIdentifier: TitleSubtitleTableViewCell.reuseIdentifier, cellType: TitleSubtitleTableViewCell.self)) { _, element, cell in
                cell.configure(from: element)
            }
            .disposed(by: self.disposeBag)
        
        
        result.coordinates
            .subscribe(onSuccess: { [weak self] coordinates in
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinates
                self?.mapView.addAnnotation(annotation)
                self?.mapView.setCenter(coordinates, animated: false)
            })
            .disposed(by: self.disposeBag)

    }
}

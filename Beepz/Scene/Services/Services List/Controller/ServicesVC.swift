//
//  ServicesVC.swift
//  Beepz
//
//  Created by Saif Adel on 25/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ServicesVC: UIViewController {

    // MARK: - IB Outlet
    @IBOutlet weak var tableView: CustomTableView!
    
    // MARK: - Local Storage
    public var coordinator: ServicesVCCoordinator?
    private let viewModel = ServicesVM()
    private let disposable = DisposeBag()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        fatchDataFromAPI()
    }
    
    private func fatchDataFromAPI(){
        //viewModel.services.onNext([1,2,3])
        viewModel.getDataWith(resource: viewModel.createResource() as! Resource<ServiceModel.Response> )
    }
}

// MARK: - Data binding
extension ServicesVC {
    private func setupBinding(){
        viewModel
            .services
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: ServiceTVCell.identifier, cellType: ServiceTVCell.self)) {  (row,vm,cell) in
                cell.eachItem = vm
            }
            .disposed(by: disposable)
        
        tableView
            .rx.modelSelected(ServiceModel.ServiceTVModel.self)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] model in
                self?.coordinator?.presentServiceTracker(model.trackInfo)
            })
            .disposed(by: disposable)
    }
}

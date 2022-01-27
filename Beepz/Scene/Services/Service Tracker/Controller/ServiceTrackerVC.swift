//
//  ServiceTrackerVC.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class ServiceTrackerVC: UIViewController {

    // MARK: - IB outlet
    @IBOutlet weak var topIconView: UIImageView!
    @IBOutlet weak var orderNoTitle: UILabel!
    @IBOutlet weak var tableView: CustomTableView!
    @IBOutlet weak var tableViewheightConstraint: NSLayoutConstraint!
    
    // MARK: - Local Storage
    public var coordinator: ServiceTrackerVCCoordinator?
    public let viewModel = ServiceTrackerVM()
    private let disposable = DisposeBag()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinding()
    }
    
    // MARK: - IB Action
    @IBAction func navBackButtonTapped(_ sender: Any) {
        self.coordinator?.popViewController()
    }
}

// MARK: - UI Functionalities
extension ServiceTrackerVC {
    private func setupView(){
        tableViewheightConstraint.constant = 0
    }
    private func setUIInfo(_ model: ServiceModel.ServiceTrackerModel){
        self.orderNoTitle.text = model.orderID
        self.topIconView.sd_imageIndicator = SDWebImageActivityIndicator.white
        self.topIconView.sd_setImage(with: model.image, placeholderImage:  nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
    }
}

// MARK: - Data Binding
extension ServiceTrackerVC {
    private func setupBinding(){
        viewModel
            .trackList
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: TrackerTVCell.identifier, cellType: TrackerTVCell.self)) {  (row,vm,cell) in
                cell.eachItem = vm
                
            }
            .disposed(by: disposable)
        
        viewModel
            .info
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] model in
                self?.setUIInfo(model)
                self?.viewModel.fatchData()
            })
            .disposed(by: disposable)
    }
}

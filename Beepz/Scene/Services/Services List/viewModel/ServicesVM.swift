//
//  ServicesVM.swift
//  Beepz
//
//  Created by Saif Adel on 26/01/2022.
//

import RxCocoa
import RxSwift

class ServicesVM {
    
    // MARK: Local Storage-
    private let disposable = DisposeBag()
    public let services: PublishSubject<[ServiceModel.ServiceTVModel]> = PublishSubject()

    private func convertDataModel(_ model: ServiceModel.Response){
        guard let services = model.data?.data?.map({ServiceModel.ServiceTVModel($0)}) else { return }
        self.services.onNext(services)
    }
}

//MARK: - createResource-
extension ServicesVM {
    
    public func createResource() -> Any {
        guard var url = URL.services else {
            fatalError("URl was incorrect")
        }
        
        url.appendQueryItem(name: CUSTOMER_ID, value: "34")
        var resource = Resource<ServiceModel.Response>(url: url)
        resource.httpMethod = .get
        return resource
    }
}

// MARK: API call-
extension ServicesVM {
    
    public func getDataWith<T>(resource: Resource<T>)  {
        
        APIService
            .load(resource: resource)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                switch response {
                case .success(let data):
                    let result = data as! ServiceModel.Response
                    self?.convertDataModel(result)
                case .failure(let failure):
                    switch failure {
                    case .authorizationError(_):
                        break
                    default:
                       break
                    }
                }
            }, onError: {[weak self] (error) in
                print("Something went wrong! Please try Again")
            })
            .disposed(by: disposable)
    }
    
}

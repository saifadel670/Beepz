//
//  ServiceModel.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import Foundation
import UIKit

enum ServiceModel{
    
    struct Response: Codable {
        let data : ResponseData?
        let code : Int?
        let message : String?
        let isSuccess : Bool?
    }
    
    struct ResponseData : Codable {
        let data : [DetailsData]?
    }
    
    struct DetailsData : Codable {
        let orderId : Int?
        let customerId : Int?
        let customer : Customer?
        let carId : Int?
        let car : Car?
        let categoryId : Int?
        let category : Category?
        let serviceId : Int?
        let service : Service?
        let companyWiseServiceId : Int?
        let companyWiseService : CompanyWiseService?
        let numberOfBids : Int?
        let bidId : Int?
        let bid : String?
        let companyId : Int?
        let company : Company?
        let orderImages : [String]?
        let carLatitude : String?
        let carLongitude : String?
        let readableOrderNo : String?
        let qrCodeImage : String?
        let bookingDate : String?
        let bookingTime : String?
        let details : String?
        let orderTrackId : Int?
        let orderTrack : OrderTrack?
        let couponId : Int?
        let price : Double?
        let vat : Double?
        let serviceCharge : Double?
        let subTotal : Double?
        let discount : Double?
        let grandTotal : Double?
        let totalRecord : Int?
        let driverId : Int?
        let driver : String?
        let orderPaypageUrl : String?
        let orderReference : String?
        let gatewayResponse : String?
        let accidentClaimTrackId : Int?
        let accidentClaimTrack : AccidentClaimTrack?
        let address : String?
        let emailMessage : String?
    }
    
    struct Customer : Codable {
        let customerId : Int?
        let fullName : String?
        let email : String?
        let phoneNumber : String?
        let address : String?
        let emirateId : Int?
        let emirate : Emirate?
        let isEmailNotificationEnable : Bool?
        let createdAt : String?
        let status : Bool?
        let completedOrderCount : Int?
    }
    
    struct Emirate : Codable {
        let emirateId : Int?
        let emirateName : String?
        let countryId : Int?
        let country : Country?
        let status : Bool?
    }
    
    struct Country : Codable {
        let countryId : Int?
        let name : String?
        let iso : String?
        let flag : String?
        let callingCode : String?
        let nationality : String?
        let status : Bool?
    }
    
    struct Car : Codable {
        let carId : Int?
        let vehicleBrandId : Int?
        let vehicleBrand : VehicleBrand?
        let vehicleModelId : Int?
        let vehicleModel : VehicleModel?
        let year : String?
        let vehicleNickName : String?
        let customerId : Int?
        let customer : Customer?
        let emirateId : Int?
        let emirates : Emirate?
        let plateNumber : String?
        let insuranceType : String?
        let insuranceNumber : String?
        let assistanceNo : String?
        let insuranceExpireDate : String?
        let image : [Image]?
        let vehicleYearId : Int?
        let vehicleYear : VehicleYear?
    }
    
    struct VehicleBrand : Codable {
        let vehicleBrandId : Int?
        let brandName : String?
        let icon : String?
        let details : String?
        let status : Bool?
    }
    
    struct VehicleModel : Codable {
        let vehicleModelId : Int?
        let modelName : String?
        let icon : String?
        let details : String?
        let status : Bool?
        let vehicleBrandId : Int?
        let vehicleBrand : VehicleBrand?
    }
    
    struct VehicleYear : Codable {
        let vehicleYearId : Int?
        let details : String?
        let vehicleModelId : Int?
        let vehicleModel : VehicleModel?
        let status : Bool?
    }
    
    struct Image : Codable {
        let carImageId : Int?
        let carId : Int?
        let carImages : String?
    }
    
    struct Category : Codable {
        let categoryId : Int?
        let categoryName : String?
        let icon : String?
        let details : String?
    }
    
    struct Service : Codable {
        let serviceId : Int?
        let serviceName : String?
        let details : String?
        let image : String?
        let status : Bool?
    }
    
    struct CompanyWiseService : Codable {
        let companyWiseServiceId : Int?
        let serviceId : Int?
        let service : Service?
        let companyId : Int?
        let company : Company?
        let price : Double?
        let vat : Double?
        let time : Double?
        let status : Bool?
        let details : String?
    }
    
    struct Company : Codable {
        let companyId : Int?
        let companyName : String?
        let userId : Int?
        let user : String?
        let phoneNumber : String?
        let email : String?
        let website : String?
        let logo : String?
        let emirateId : Int?
        let emirates : Emirate?
        let address : String?
        let latitude : String?
        let longitude : String?
        let details : String?
        let aboutUs : String?
        let serviceCharge : Double?
        let companyPoint : Double?
        let totalReview : Int?
        let numberOfService : Int?
        let numberOfDriver : Int?
        let completedOrder : Int?
        let pendingOrder : Int?
        let totalOrder : Int?
    }
    
    struct OrderTrack : Codable {
        let orderTrackId : Int?
        let name : String?
        let details : String?
        let level : Int?
        let image : String?
    }
    
    struct AccidentClaimTrack : Codable {
        let accidentClaimTrackId : Int?
        let name : String?
        let details : String?
        let level : Int?
        let image : String?
    }
    
    // MARK: -  viewModel data
    struct ServiceTVModel{
        let title: String?
        let detailsTitle: String?
        let dateTitle: String?
        let trackInfo: ServiceTrackerModel
        
        init(_ model: DetailsData ){
            var plateNumber: String = ""
            if let number = model.car?.plateNumber {
                plateNumber = "(\(number))"
            }
            self.title = model.category?.categoryName
            self.detailsTitle = "Car Details: \(model.car?.vehicleNickName ?? "") \(plateNumber)"
            self.dateTitle = "Date of Services: 2 Jan, 2022"
            self.trackInfo = ServiceTrackerModel(icon: model.category?.icon, orderID: model.readableOrderNo, trackID: model.orderTrackId)
        }
    }
    
    struct ServiceTrackerModel{
        let image: URL?
        let orderID: String
        let ordertrackID: Int
        
        init( icon: String? = nil ,orderID: String? = nil, trackID: Int? = nil){
            self.image = URL(string: icon ?? "")
            self.orderID = orderID ?? ""
            self.ordertrackID = trackID ?? 0
        }
    }
}

//
//  ServiceTrackerVM.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import RxSwift
import RxCocoa

class ServiceTrackerVM {
    
    // MARK: - Local Storage
    public let info: BehaviorRelay<ServiceModel.ServiceTrackerModel> = BehaviorRelay(value: ServiceModel.ServiceTrackerModel())
    public let trackList: PublishSubject<[TrackerModel.TrackerTVModel]> = PublishSubject()
    
    public func fatchData(){
        var trackList = getDummyTrackerData().map({ TrackerModel.TrackerTVModel($0, trackID: info.value.ordertrackID)})
        let lastElementindex = (trackList.count - 1)
        lastElementindex > 0 ? trackList[lastElementindex].hideLine() : nil
        self.trackList.onNext(trackList)
    }
    
    /*
        Track Data is not found in api. so dummy data used to view
     */
    public func getDummyTrackerData() -> [TrackerModel.TrackerTVModel]{
        let dummyTraclList = [
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 1, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 2, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 3, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 4, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 4, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 5, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 6, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 7, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 8, completedTrackID: info.value.ordertrackID),
            TrackerModel.TrackerTVModel(title: "Booking Confirmed", desc: "Your booking request is confirmed", trackId: 9, completedTrackID: info.value.ordertrackID)
        ]
        return dummyTraclList
    }
}

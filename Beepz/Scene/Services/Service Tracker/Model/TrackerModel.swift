//
//  TrackerModel.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import Foundation
import UIKit

enum TrackerModel {
    struct TrackerTVModel{
        let trackID: Int
        var statusIcon: UIImage?
        let trackImage: UIImage?
        let title: String?
        let description: String?
        let lineColor : UIColor
        var isLineShow : Bool = true
        
        init(title: String, desc: String, trackId: Int, completedTrackID: Int){
            self.trackID = trackId
            self.statusIcon = UIImage(named: "circleIcon")
            self.trackImage = UIImage(named: "service")
            self.title = title
            self.description = desc
            self.lineColor = .lightGray
        }
        
        init(_ model: TrackerTVModel, trackID: Int) {
            let isDone = model.trackID <= trackID
            self.trackID = model.trackID
            self.trackImage = model.trackImage
            self.title = model.title
            self.description = model.description
            self.statusIcon = isDone ? UIImage(named: "checkMarkIcon") : UIImage(named: "circleIcon")
            self.lineColor = isDone ? .darkGray : .lightGray
        }
        
        mutating func hideLine(){
            self.isLineShow = false
        }
    }
}

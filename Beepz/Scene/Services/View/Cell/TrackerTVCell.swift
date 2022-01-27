//
//  TrackerTVCell.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import UIKit

class TrackerTVCell: UITableViewCell {

    public static let identifier = "TrackerTVCell"
    
    // MARK: - IB Outlet
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var statusImageView: CircleImageView!
    @IBOutlet weak var trackImageView: CircleImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var eachItem: TrackerModel.TrackerTVModel! {
        didSet {
            self.lineView.isHidden = !eachItem.isLineShow
            self.lineView.backgroundColor = eachItem.lineColor
            self.statusImageView.image = eachItem.statusIcon
            self.trackImageView.image = eachItem.trackImage
            self.titleLabel.text = eachItem.title
            self.descLabel.text = eachItem.description
        }
    }

}

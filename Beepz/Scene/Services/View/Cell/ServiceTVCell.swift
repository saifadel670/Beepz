//
//  ServiceTVCell.swift
//  Beepz
//
//  Created by Saif Adel on 26/01/2022.
//

import UIKit
import SDWebImage

class ServiceTVCell: UITableViewCell {

    public static let identifier = "ServiceTVCell"
    
    // MARK: - IB Outlet
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var carInfoLabel: UILabel!
    @IBOutlet weak var serviceDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var eachItem: ServiceModel.ServiceTVModel! {
        didSet {
            self.iconImageView.sd_imageIndicator = SDWebImageActivityIndicator.white
            self.iconImageView.sd_setImage(with: eachItem.trackInfo.image, placeholderImage:  nil, options: SDWebImageOptions(rawValue: 0), completed: nil)
            self.titleLabel.text = eachItem.title
            self.carInfoLabel.text = eachItem.detailsTitle
            self.serviceDateLabel.text = eachItem.dateTitle

        }
    }

}

//
//  CarCollectionViewswift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 04/03/2022.
//

import UIKit
import Cosmos
import Haneke

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    func load(car: Car) {
        brandLabel.text = "\(car.brand) \(car.model)"
        priceLabel.text = "\(car.pricePerDay)€/j"
        ratingView.rating = car.rating.average
        ratingView.text = "\(car.rating.count)"
        
        let imageURL = URL(string: car.pictureUrl)!
        carImageView.hnk_setImageFromURL(imageURL)
    }
    
    override func prepareForReuse() {
        imageView?.image = nil
    }
    
}

//
//  CarDetailsViewController.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 07/03/2022.
//

import UIKit
import Cosmos

class CarDetailsViewController: UIViewController {
    
    var car: Car?
    
    // Car IBOutlets
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carRatingView: CosmosView!
    
    // Owner IBOutlets
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerRatingView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let carImageURL = URL(string: car!.pictureUrl)!
        carImageView.hnk_setImageFromURL(carImageURL)
        brandLabel.text = "\(car!.brand) \(car!.model)"
        priceLabel.text = "\(car!.pricePerDay)€/j"
        carRatingView.rating = car!.rating.average
        carRatingView.text = "\(car!.rating.count)"
        
        let ownerImageURL = URL(string: car!.owner.pictureUrl)!
        ownerImageView.hnk_setImageFromURL(ownerImageURL) { error in
            self.ownerImageView.image = UIImage(systemName: "person.crop.circle")
        } success: { image in
            self.ownerImageView.image = image
        }
        
        ownerLabel.text = car!.owner.name
        ownerRatingView.rating = car!.owner.rating.average
    }
    
}

//
//  ViewController.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 04/03/2022.
//

import UIKit
import Alamofire

class CarsViewController: UIViewController, UITableViewDataSource {
    
    var cars: [Car] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRepos()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath as IndexPath) as! CarTableViewCell
        cell.load(car: cars[indexPath.row])
        return cell
    }
    
}

extension CarsViewController {
    
    func fetchRepos() {
        let request = AF.request("https://raw.githubusercontent.com/drivy/mobile-technical-test/master/api/cars.json")
        
        request.responseDecodable(of: [Car].self) { [weak self] (response) in
            guard let cars = response.value else { return }
            self?.cars = cars
            self?.tableView.reloadData()
        }
    }
    
}

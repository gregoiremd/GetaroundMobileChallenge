//
//  ViewController.swift
//  GetaroundMobileChallenge
//
//  Created by Grégoire Marchand on 04/03/2022.
//

import UIKit
import Alamofire

class CarsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cars: [Car] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Voitures disponibles"
        
        // Get the cars list from APIManager
        APIManager.getCars { [weak self] (cars) in
            self?.cars = cars
            self?.tableView.reloadData()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Return the numbers of cars
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath as IndexPath) as! CarTableViewCell
        cell.load(car: cars[indexPath.row])
        return cell
    }
    
    // Perform segue to CarDetailsViewController when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "ListToDetailsSegue", sender: cell)
    }
    
    // Pass car data to CarDetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CarDetailsViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                vc.car = cars[indexPath.row]
            }
        }
    }
    
}

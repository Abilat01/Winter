//
//  ViewController.swift
//  Winter
//
//  Created by Danya on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var winterIconImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var HumindityLabel: UILabel!
    @IBOutlet weak var toDayDateLabel: UILabel!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchCurrentWeather(forCity: "London")
    }

    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertControler(withTitle: "Enter city Name", messege: nil, style: .alert)
    }
    
}


//
//  ViewController.swift
//  Winter
//
//  Created by Danya on 11.10.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var winterIconImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humindityLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var toDayDateLabel: UILabel!
    
    var networkManager = NetworkManager()
    lazy var locationManager: CLLocationManager = {
      var lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        lm.delegate = self
        return lm
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.onComplition = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updeteInterFace(weather: currentWeather)
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
    @IBAction func searchPressed(_ sender: UIBarButtonItem) {
        self.presentSearchAlertControler(withTitle: "Enter city Name", messege: nil, style: .alert) { [unowned self] cityName in
            self.networkManager.fetchCurrentWeather(forRequestType: NetworkManager.RequestType.cityName(city: cityName))
        }
    }
    
    func updeteInterFace(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelLikeLabel.text = weather.feelLikeTempiratureString
            self.pressureLabel.text = weather.pressureString
            self.humindityLabel.text = weather.humidityString
            self.tempMinLabel.text = weather.tempiratureMinString
            self.tempMaxLabel.text = weather.tempiratureMaxString
            self.winterIconImage.image = UIImage(systemName: weather.sistemIconNameString)
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

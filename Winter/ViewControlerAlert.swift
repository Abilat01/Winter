//
//  ViewControlerAlert.swift
//  Winter
//
//  Created by Danya on 12.10.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertControler(withTitle title: String?, messege: String?, style: UIAlertController.Style) {
        
        let alertControler = UIAlertController(title: title, message: messege, preferredStyle: style)
        alertControler.addTextField { tf in
            
            let cityes = ["Moscow", "New York", "Kolpino", "Berlin", "Praga"]
            tf.placeholder = cityes.randomElement()
        }
        let searchAction = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertControler.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("search info for the \(cityName)")
            }
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .default)
        
        alertControler.addAction(searchAction)
        alertControler.addAction(cancelAlert)
        present(alertControler, animated: true, completion: nil)
    }
}

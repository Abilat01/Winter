//
//  NetworkManager.swift
//  Winter
//
//  Created by Danya on 12.10.2021.
//

import Foundation

struct NetworkManager {
    
    let session = URLSession(configuration: .default) //настройки сессии
    
    func fetchCurrentWeather(forCity city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(APIKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
           
        } //запрос данных
        task.resume()
        
    }
    
}
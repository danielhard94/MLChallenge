//
//  NetworkManager.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 1/04/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager() // patron Singleton permite llamar funciones sin crear una instancia de la clase 
    
    init () {}
    
    func getListProduct(urlServices: String, completed: @escaping (Result<[ProductMLModel], APError>) -> Void ) {
        guard let url = URL(string: urlServices) else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(.failure(.unableToComplete))
                print("Debug: error \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completed(.failure(.invalidResponse))
                print("Debug: invalid response")
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                print("Debug: invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ProductMLResponse.self, from: data)
            
                completed(.success(decodedResponse.results))
         
            } catch {
                completed(.failure(.decodingError))
                print("Debug: decoding error \(error.localizedDescription)")
            }
        }.resume()
    }

}


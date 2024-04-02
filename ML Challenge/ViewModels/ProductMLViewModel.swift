//
//  ProductMLViewModel.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 1/04/24.
//

import Foundation

class ProductMLViewModel: ObservableObject {
    @Published var listProductML = [ProductMLModel]()
    @Published var filterProductML = [ProductMLModel]()
    
    init() {
        getListProductML()
    }
    
    func getListProductML() {
        NetworkManager.shared.getListProduct(urlServices: "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let listProductML):
                    print("listProductML: \(listProductML.count)")
                    
                    let products = listProductML.map{ productML -> ProductMLModel in
                        var secureProduct = productML
                        secureProduct.thumbnail = self.secureURL(productML.thumbnail)
                        return secureProduct
                    }
                    
                    self.listProductML = products
                    self.filterProductML = products
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
    
    func filterProductML(nameProduct: String) {
        if nameProduct.isEmpty {
            filterProductML = listProductML
        } else {
            filterProductML = listProductML.filter({ productML in
                productML.title.lowercased().contains(nameProduct.lowercased())
            })
        }
    }
    
    func formatIntToStringWithCommas(_ intValue: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: intValue)) ?? "0"
    }
    
    func secureURL(_ urlString: String) -> String {
        return urlString.replacingOccurrences(of: "http://", with: "https://")
    }
}

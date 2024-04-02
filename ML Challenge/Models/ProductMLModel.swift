//
//  ProductMLModel.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 1/04/24.
//

import Foundation

// Estructura de datos para representar un producto de Mercado Libre.
struct ProductMLModel: Codable, Hashable {
    let id: String
    let title: String
    var thumbnail: String
    let price: Int
}

// Estructura de datos para representar una respuesta de productos de Mercado Libre.
struct ProductMLResponse: Codable {
    let results: [ProductMLModel]
}

//
//  MockData.swift
//  ML ChallengeTests
//
//  Created by Daniel Peralta on 2/04/24.
//


import Foundation
@testable import ML_Challenge

struct mockData {
    static let productListData: Data = """
    {
        "results": [
            {
                "id": "1",
                "title": "iPhone 15 pro max",
                "thumbnail": "https://example.com/iphone.jpg",
                "price": 500999
            },
            {
                "id": "2",
                "title": "Samsung Galaxy 23",
                "thumbnail": "https://example.com/galaxy.jpg",
                "price": 7110799
            }
        ]
    }
    """.data(using: .utf8)!
    
    
    static let productML = ProductMLModel(id: "MA1426238366", title: "Samsung Galaxy A24 128 Gb  Negro 6 Gb Ram", thumbnail: "https://http2.mlstatic.com/D_832809-MLU74194834317_012024-I.jpg", price: 524999)
    
}

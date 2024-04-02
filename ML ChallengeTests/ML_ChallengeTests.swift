//
//  ML_ChallengeTests.swift
//  ML ChallengeTests
//
//  Created by Daniel Peralta on 1/04/24.
//

import XCTest
@testable import ML_Challenge


final class ML_ChallengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFilterProductML() {
        let viewModel = ProductMLViewModel()
        
        // Crear algunos productos de prueba
        let product1 = ProductMLModel(id: "1", title: "iPhone 13", thumbnail: "https://example.com/iphone.jpg", price: 999)
        let product2 = ProductMLModel(id: "2", title: "Samsung Galaxy", thumbnail: "https://example.com/galaxy.jpg", price: 799)
        
        // Agregar los productos a la lista de productos del viewModel
        viewModel.listProductML = [product1, product2]
        
        // Filtrar la lista de productos por el nombre del producto
        viewModel.filterProductML(nameProduct: "iphone")
        
        // Verificar que el resultado coincida con lo esperado
        XCTAssertEqual(viewModel.filterProductML.count, 1)
        XCTAssertEqual(viewModel.filterProductML.first?.title, "iPhone 13")
    }
    
    func testFormatIntToStringWithCommas() {
        let viewModel = ProductMLViewModel()
        
        // Probar el formateo de un número entero
        let formattedString = viewModel.formatIntToStringWithCommas(1000)
        let formattedString1 = viewModel.formatIntToStringWithCommas(0)
        print(formattedString1,"formattedString1")
        // Verificar que el resultado coincida con lo esperado
        XCTAssertEqual(formattedString, "1.000")
        XCTAssertEqual(formattedString1, "0")
    }
}

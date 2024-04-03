//
//  ContentView.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 1/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ProductMLViewModel()
    @State private var productMLToSearch = ""
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: numberOfColumns, content: {
                    ForEach(viewModel.filterProductML,id: \.self) { productML in
                        NavigationLink(destination: ProductDetailView(productML: productML)) {
                            ProductMLCellView(productML: productML)
                        }
                    }
                })
            }
        }
        .searchable(text: $productMLToSearch,prompt: "Buscar producto")
        .onChange(of: productMLToSearch) { newValue, oldValue in
            withAnimation {
                viewModel.filterProductML(nameProduct: newValue)
            }
        }
        .navigationTitle("Mercadolibre")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


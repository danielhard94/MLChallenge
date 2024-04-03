//
//  ProductDetailView.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 2/04/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let productML: ProductMLModel
    
    @StateObject var viewModel = ProductMLViewModel()
    @State private var isAnimating = false
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: productML.thumbnail)) { statusImage in
                switch statusImage {
                case .empty:
                    ProgressView()
                case .success(let imagen):
                    imagen.resizable().aspectRatio(contentMode: .fill)
                case .failure:
                    // mensaje de error
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
            .frame(width: 200,height: 200)
            .scaleEffect(isAnimating ? 1.2 : 0.7)
            .padding()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.").font(.headline)
            VStack{
                Text("Referencia: \(productML.id)")
                    .foregroundStyle(.blue)
                    .bold()
                Text("Precio: $ \(viewModel.formatIntToStringWithCommas(productML.price))")
                    .foregroundStyle(.green)
                    .bold()
                
            }
            
            
        }.padding(15)
            .navigationTitle(productML.title)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation{
                        isAnimating = true
                    }
                }
            }
    }
}

#Preview {
    ProductDetailView(productML: mockData.productML)
}

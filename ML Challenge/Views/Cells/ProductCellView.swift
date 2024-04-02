//
//  ProductCellView.swift
//  ML Challenge
//
//  Created by Daniel Peralta on 2/04/24.
//

import SwiftUI


struct ProductMLCellView: View {
    
    let productML : ProductMLModel
    
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(Color.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            VStack (alignment: .center, spacing: 8){
                Spacer()
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
                .frame(width: 100,height: 100)
                .shadow(radius: 12)
                Text(productML.title).font(.body).foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ProductMLCellView(productML: MockData.productML)
}

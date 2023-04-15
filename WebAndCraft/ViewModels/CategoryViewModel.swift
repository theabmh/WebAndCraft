//
//  CategoryViewModel.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

class CategoryViewModel: ObservableObject{
    
    private var imageLoader = ImageDownloadManager()
    
    @Published var categoryImage : UIImage?
    
    func getImage(imageUrl: String)  {
        imageLoader.downloadImage(imageUrl: imageUrl) { [weak self] image, error in
            if let image = image{
                DispatchQueue.main.async {
                    self?.categoryImage = image
                }
            }else{
                print(error?.localizedDescription ?? "Error downloading Image")
            }
        }
    }
}

//
//  ImageDownloadManager.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

class ImageDownloadManager {
    func downloadImage(imageUrl: String, completion: @escaping(UIImage?,Error?)->Void) {
        guard let url = URL(string: imageUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return}
            let image = UIImage(data: data)
            completion(image, nil)
        }
        .resume()
    }
}

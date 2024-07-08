//
//  ImageView.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 25.06.2024.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = #imageLiteral(resourceName: "picture")
            return
        }
        // Если изображение есть в кеше, то используем его
        if let cachedImage = ImageCache.shared.getCachedImage(url: url) {
            image = cachedImage
            return
        }
        // Если изображения в кеше нет, то грузим его из сети
        ImageManager.shared.getImage(from: url) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            // Сохраняем изображение в кеш
            ImageCache.shared.saveDataToCache(with: data, and: response)
        }
    }
}





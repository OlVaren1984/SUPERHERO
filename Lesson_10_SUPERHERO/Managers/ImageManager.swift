//
//  ImageManager.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 25.06.2024.
//

import Foundation

class ImageManager {
    //    Этот класс ImageManager обеспечивает удобный способ загрузки изображений из сети. Он гарантирует, что изображения загружаются асинхронно, обрабатываются ошибки и проверяется корректность URL.
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            
            //сравнимаем два url из сети и из кеша если они равны, то работаем с data и response целиком
      //      guard responseURL == url else { return }
            completion(data, response)
        }.resume()
    }
}

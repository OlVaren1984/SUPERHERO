//
//  ImageCache.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 08.07.2024.
//

import UIKit

class ImageCache {
    
    static let shared = ImageCache() // Создаем Singleton
    
    private init() {} // Создаем Private initializer
    
    func getCachedImage(url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
    
    func saveDataToCache(with data: Data, and response: URLResponse) {
        //  Проверяем, есть ли в response  URL-адрес, используем guard let. Если URL-адреса нет (nil), функция немедленно прекращает работу с помощью return.
        guard let urlResponse = response.url else { return }
        //  Создаем объект CachedURLResponse, который будет кэширован. Он содержит: response: исходный HTTP-ответ. data: данные, которые нужно кэшировать.
        let cachedResponse = CachedURLResponse(response: response, data: data)
        // Создает объект URLRequest, используя URL-адрес из ответа (urlResponse). Этот объект будет использовать для извлечения кэшированных данных в будущем.
        let urlRequest = URLRequest(url: urlResponse)
        // Вызываем метод storeCachedResponse  объекта URLCache.shared  для сохранения кэшированных данных. Он сохраняет cachedResponse  с помощью urlRequest  в качестве ключа.
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
/*
 Зачем использовать кэширование данных?
 Кэширование данных позволяет:
 Ускорить загрузку:  Если данные уже кэшированы, приложение может получить их из кэша, а не загружать их снова из сети.
 Снизить нагрузку на сервер:  При использовании кэширования данные загружаются с сервера реже, снижая нагрузку.
 Улучшить пользовательский опыт:  Страницы приложения будут загружаться быстрее, что сделает использование приложения более приятным.
 */

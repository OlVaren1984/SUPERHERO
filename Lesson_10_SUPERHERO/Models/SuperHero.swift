//
//  CourseHero.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 20.06.2024.
//

// Структура для изображения для Супергероев
struct Image: Decodable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}

// Структура для внешности
struct Appearance: Decodable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?
}

// Структура для биографии
struct Biography: Decodable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}

// Структура для работы
struct Work: Decodable {
    let occupation: String?
    let base: String?
}

// Структура для связей
struct Connections: Decodable {
    let groupAffiliation: String?
    let relatives: String?
}

// Главная структура для супергероя
struct SuperHero: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
    let powerstats: [String: Int]?
    let appearance: Appearance?
    let biography: Biography?
    let work: Work?
    let connections: Connections?
    let images: Image?
}




// Изначальная версия массива
//struct SuperHero: Decodable {
//    let response: String?
//    let id: String?
//    let name: String?
//    let powerstats: Powerstats?
//    let image: Image?
//}
//
//struct Powerstats: Decodable {
//    let intelligence: String?
//    let strength: String?
//    let speed: String?
//    let durability: String?
//    let power: String?
//    let combat: String?
//}
//
//struct Image: Decodable {
//    let url: String?
//}

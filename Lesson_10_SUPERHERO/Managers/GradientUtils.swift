//
//  ColorImageView.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 08.07.2024.
//

import UIKit

class GradientUtils {
    //    Этот класс GradientUtils обеспечивает удобный способ вынести функцию распределения цвета в отдельный управляющий файл-менеджер. Теперь функция addVerticalGradientLauerView находится в отдельном файле, что делает код более организованным. Теперь можно использовать эту функцию в других контроллерах, просто импортируя GradientUtils.swift.
    
    static func addVerticalGradientLauerView(to view: UIView, topColor: UIColor, bottonColor: UIColor) {
        let gradient = CAGradientLayer()
        // задаем границы, как будет располагаться цвет - по границам экрана (view)
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottonColor.cgColor]
        // задаем границы от куда начать и где закончить, весь экран площадь - это 1, соответственно от 0 до 1
        gradient.locations = [0.0, 1.0]
        // передаем координаты, откуда начать
        gradient.startPoint = CGPoint(x: 0, y: 0)
        // передаем координаты, где закончить
        gradient.endPoint = CGPoint(x: 0, y: 1)
        // вызываем градиент
        view.layer.insertSublayer(gradient, at: 0)
    }
}


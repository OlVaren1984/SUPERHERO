//
//  StartViewController.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 20.06.2024.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: Private color задаем параметры цвета для этого StartViewController
    private let primatyColorView = UIColor( //Значение цвета с верху экрана
        red: 220/255,
        green: 240/255,
        blue: 255/255,
        alpha: 1
    )
    private let secondaryColorView = UIColor( // Значение цвета с низу экрана
        red: 180/255,
        green: 204/255,
        blue: 222/255,
        alpha: 1
    )
    
    private let nameButton = "FOLLOW YOUR HERO"
    private let ironManURL = "https://i.pinimg.com/736x/50/3b/86/503b86a1b846d3bae9fe53dcded204ba.jpg"
    
    @IBOutlet var startImageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.setTitle(nameButton, for: .normal)
        
        //Градиент экрана, смена цвета на градиент
        GradientUtils.addVerticalGradientLauerView(to: self.view,
                                                   topColor: primatyColorView,
                                                   bottonColor: secondaryColorView
        )
        
// Скругляем углы у UIImageView до загрузки изображения scaleAspectFill - это один из режимов масштабирования (contentMode) для UIImageView в Swift. Он определяет, как изображение будет масштабироваться, чтобы поместиться в рамки UIImageView.
        startImageView.contentMode = .scaleAspectFill
        startImageView.layer.cornerRadius = 10
        startImageView.layer.masksToBounds = true
        
        fetchImage()
    }
    
    private func fetchImage() {
        guard  let imageURL = URL(string: ironManURL) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response) }
            if let data = data, let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    self.startImageView.image = image
                }
            }
        }.resume()
    }
}

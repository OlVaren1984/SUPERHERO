//
//  FinalViewController.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 26.06.2024.
//

import UIKit

class FinalViewController: UIViewController {
    
    //MARK: Private color
    private let primatyColorView = UIColor( //Значение цвета с верху экрана
        red: 240/255,
        green: 245/255,
        blue: 250/255,
        alpha: 1
    )
    private let secondaryColorView = UIColor( // Значение цвета с низу экрана
        red: 150/255,
        green: 160/255,
        blue: 170/255,
        alpha: 1
    )
    
    @IBOutlet var finalImageView: ImageView!
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelSlug: UILabel!
    @IBOutlet var labelPubliser: UILabel!
    @IBOutlet var labelGender: UILabel!
    @IBOutlet var labelFirst: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    
    var superHeroDetails:  SuperHero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.setTitle("EXIT", for: .normal)
        finalImageView.layer.cornerRadius = finalImageView.bounds.width / 2

        //Градиент экрана, смена цвета на градиент
        GradientUtils.addVerticalGradientLauerView(to: self.view,
                                                   topColor: primatyColorView,
                                                   bottonColor: secondaryColorView
        )
        
        setupLabels()
        setupChracterImageView()
//        setupNavigationBar()
        
        finalImageView.contentMode = .scaleAspectFill
        finalImageView.layer.masksToBounds = true
        
    }
    
    // Возврат на предыдущий экран
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupChracterImageView() {
                finalImageView.fetchImage(from: superHeroDetails?.images?.lg ?? "")
// формат кода когда данные не из кеша, а из интерента грузятся так же как и на первом экране 
//        if let imageUrl = superHeroDetails.images?.lg {
//            // Преобразование строки в URL - вернул старый способ получения изображения.
//            if let url = URL(string: imageUrl) {
//                URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    if let data = data, let image = UIImage(data: data) {
//                        if let error = error { print(error); return }
//                        if let response = response { print(response) }
//                        
//                        DispatchQueue.main.async {
//                            self.finalImageView.image = image
//                            self.finalImageView.contentMode = .scaleAspectFill
//                            self.finalImageView.layer.masksToBounds = true
//                        }
//                    }
//                }.resume()
//            }
//        }
    }
    
    func setupLabels() {
        labelName.text = "My name is - \(superHeroDetails?.name ?? "")"
        labelSlug.text = "Slug - \(superHeroDetails?.slug ?? "")"
        labelPubliser.text = "Publiser - \(superHeroDetails?.biography?.publisher ?? "")"
        labelGender.text = "Gender - \(superHeroDetails?.appearance?.gender ?? "")"
        labelFirst.text = "First - \(superHeroDetails?.appearance?.hairColor ?? "")"
    }
//    Когда необходимо передать имя в title
    //    private func setupNavigationBar() {
    //        navigationItem.leftBarButtonItem = nil
    //        title = superHeroDetails.name
    //
    //        if let topItem = navigationController?.navigationBar.topItem {
    //            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    //        }
    //    }
}

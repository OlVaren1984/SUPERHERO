//
//  CourseTableViewCell.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 21.06.2024.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet var courseImageCell: ImageView!
    
    @IBOutlet var labelAppearance: UILabel!
    @IBOutlet var labelBiography: UILabel!
    @IBOutlet var labelName: UILabel!
    
    func configure(with superHero: SuperHero) {
        labelAppearance?.text = superHero.appearance?.race
        labelBiography?.text = superHero.biography?.placeOfBirth
        labelName?.text = superHero.name
        
        if let imageUrl = superHero.images?.sm {
            // Преобразование строки в URL
            if let url = URL(string: imageUrl) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let image = UIImage(data: data) {
                        if let error = error { print(error); return }
                        if let response = response { print(response) }
                        
                        DispatchQueue.main.async {
                            self.courseImageCell.image = image
                            self.courseImageCell.layer.cornerRadius = self.courseImageCell.bounds.width / 2
                            self.courseImageCell.backgroundColor = .black
                            self.courseImageCell.contentMode = .scaleAspectFill
                            self.courseImageCell.layer.masksToBounds = true
                        }
                    }
                }.resume()
            }
        }
    }
}


 


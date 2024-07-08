//
//  CourseTableViewController.swift
//  Lesson_10_SUPERHERO
//
//  Created by Олег Варенников  on 20.06.2024.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    private let jsonUrlOne =   "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
    private var superHeroes: [SuperHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Задаем высоту строки
        tableView.rowHeight = 85
        fetchDataOne()
        // Реализумем метод входа в режиме редактирования, два варианта, кнопка с лева и кнопка с права
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        superHeroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseTableViewCell
        let superHero = superHeroes[indexPath.row]
        cell.configure(with: superHero)
        return cell
    }
    
    //входим в режим редактирования и можем менять местами
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentHero = superHeroes.remove(at: sourceIndexPath.row) // Извлечение индекса из sourceIndexPath
        superHeroes.insert(currentHero, at: destinationIndexPath.row) // Извлечение индекса из destinationIndexPath
    }
    // убираем красные куружочки в режиме редактированя
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    // убираем отсуп с лева в режиме редактирования
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // MARK: - подготавливаем данные для передачи на финальный экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let superHero = superHeroes[indexPath.row]
        let detailVC = segue.destination as! FinalViewController
        detailVC.superHeroDetails = superHero
    }
    
    func fetchDataOne() {
        guard let url = URL(string: jsonUrlOne)  else {
            print("Неверный URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                print("Данные не получены")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let superHeroes = try decoder.decode([SuperHero].self, from: data)
                self.superHeroes = superHeroes
                DispatchQueue.main.async {
                    self.tableView.reloadData() // Перезагрузить таблицу
                }
            } catch let error {
                print("Ошибка декодирования данных: \(error.localizedDescription)")
            }
        }.resume()
    }
}






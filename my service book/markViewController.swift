//
//  markViewController.swift
//  my service book
//
//  Created by Умид Халилов on 21.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit
import CoreData

class markViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    struct carInfo {
        static var carModelName = ""
        static var carModelId = Int()
    }


    
    
    
    
    var myTableView = UITableView()
    let indentifire = "MyCell"
    
    let markNameArr = ["Audi", "BMW", "Ford", "Honda", "Hyundai", "Kia", "Lada (ВАЗ)", "Mazda", "Mercedes-Benz", "Mitsubishi", "Nissan", "Renault", "Skoda", "Toyota", "Volkswagen", "Acura", "Daihatsu", "Datsun", "Honda", "Infiniti", "Isuzu", "Lexus", "Mazda", "Mitsubishi", "Scion", "Subaru", "Suzuki", "Toyota", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge", "Ford", "GMC", "Hummer", "Jeep", "Lincoln", "Mercury", "Oldsmobile", "Pontiac", "Tesla", "Aurus", "Lada (ВАЗ)", "ГАЗ", "Москвич", "ТагАЗ", "УАЗ", "Audi", "BMW", "Mercedes-Benz", "Opel", "Porsche", "Volkswagen", "Daewoo", "Genesis", "Hyundai", "Kia", "SsangYong", "Alfa Romeo", "Aston Martin", "Bentley", "Bugatti", "Citroen", "DS", "Ferrari", "Fiat", "Jaguar", "Lamborghini", "Lancia", "Land Rover", "Maserati", "Maybach", "Mini", "Peugeot", "Ravon", "Renault", "Rolls-Royce", "Rover", "Saab", "SEAT", "Skoda", "Smart", "Volvo", "ZAZ", "Brilliance", "BYD", "Changan", "Chery", "DongFeng", "FAW", "Foton", "GAC", "Geely", "Great Wall", "Haima", "Haval", "JAC", "Lifan", "Luxgen", "Zotye"]
    
    //    var searchMark = [String]()
    //    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable()
        
    }
    
    func creatTable() {
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }
    
    //MARK: - DataSourse
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath) // создаем ячейку
        
        let number = markNameArr[indexPath.row]
        
        cell.textLabel?.text = number
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return markNameArr.count // количество ячеек ОБЯЗАТЕЛЬНО НУЖНО НАПИСАТЬ
    }
    //MARK: - Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // функция срабатывает при нажатие на элемент
        markViewController.carInfo.carModelId = indexPath.row
        markViewController.carInfo.carModelName = markNameArr[indexPath.row]
        print("id элемента =\(markViewController.carInfo.carModelId)") // indexPath - это индекс, row строка
        print("Название элемента =\(markViewController.carInfo.carModelName)")
//        dismiss(animated: true, completion: nil) // отмена сегвея
        dismiss(animated: true) {
            
        }

            
      
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0 // размер ячейки
    }
}


//    //MARK: TEST
// extension markViewController: UITableViewDataSource, UITableViewDelegate{
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cell") // обращаемся к tv с идентификатором cell
//
//         cell?.textLabel?.text = markNameArr[indexPath.row]
//         if searching{
//             cell?.textLabel?.text = searchMark[indexPath.row]
//
//         }
//         else {
//             cell?.textLabel?.text = markNameArr[indexPath.row]
//         }
//
//         return cell!
//     }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         if searching{
//
//             return searchMark.count
//         }
//         else {
//             return markNameArr.count
//         }
//
//     }
// }
// extension markViewController: UISearchBarDelegate { // отвечает за поиск элементов, здесь ничего не трогай, делай по примеру
//     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//         searchMark = markNameArr.filter({$0.prefix(searchText.count) == searchText})
//         searching = true
//         tblView.reloadData()
//     }
//
//}

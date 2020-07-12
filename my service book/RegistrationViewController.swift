//
//  RegistrationViewController.swift
//  my service book
//
//  Created by Умид Халилов on 02.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var secondNameTxtFld: UITextField!
    @IBOutlet weak var saveBtnOtlt: UIButton!
    @IBOutlet weak var markBtnOutl: UIButton!
    @IBOutlet weak var modelBtnOutl: UIButton!
    
    var nameError = false, secondnameError = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtnOtlt.layer.cornerRadius = saveBtnOtlt.frame.size.height / 4
        markBtnOutl.layer.cornerRadius = saveBtnOtlt.frame.size.height / 4
        modelBtnOutl.layer.cornerRadius = saveBtnOtlt.frame.size.height / 4
         
        self.buttonNameChange() // функция смена название кнопки
  
    }
   //MARK: - эксперементы с загрузочными функциями

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func awakeFromNib() {
        print("awakeFromNib")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
    dismiss(animated: true, completion: nil) // отмена сегвея
    }
    
    @IBAction func savaBtn(_ sender: Any) {
        check()
        alert()
    }
    
    //MARK: - alert
    func alert() {
         if nameError == true && secondnameError == true {
            
             let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели имя и фамилию", preferredStyle: .alert)

             alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
             self.present(alert, animated: true)
         }
         if nameError == true {
             let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели имя", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
                        self.present(alert, animated: true)
         }
         if secondnameError == true {
             let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели фамилию", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
             self.present(alert, animated: true)
         }
     }
    //MARK: - BUTTON NAME CHANGE
    func buttonNameChange(){
        if markViewController.carInfo.carModelName != "" {
            markBtnOutl.setTitle(markViewController.carInfo.carModelName, for: .normal)
        }
        else {
            markBtnOutl.setTitle("Выбрать1", for: .normal)
        }
    }
  //MARK: - check textField isEmpty
    func check(){
        if nameTxtFld.text == "" {
            ViewController().errorBorder(textField: nameTxtFld)
            nameError = true
        }
        else {
            nameError = false
        }
        if secondNameTxtFld.text == ""{
            ViewController().errorBorder(textField: secondNameTxtFld)
            secondnameError = true
        }
        else {
            secondnameError = false
        }
        if nameTxtFld.text != "" && secondNameTxtFld.text != "" {
            performSegue(withIdentifier: "addCarSegue", sender: self)
        }
    }
    
    //MARK: - проверяем на выбор автомобиля
    func checkCarView(){
//        if markViewController.carInfo.carModelId ==  {
//            
//        }
    }
}

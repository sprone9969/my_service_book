//
//  ViewController.swift
//  my service book
//
//  Created by Умид Халилов on 01.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBAction func phoneChange(_ sender: Any) { // проверяем что, чтото происходит https://stackoverflow.com/questions/28394933/how-do-i-check-when-a-uitextfield-changes
        if phoneTxtFld.text?.count == 1 {
            print("вошел")
            self.phoneTxtFld.text = "+7 ("
        }
        if phoneTxtFld.text?.count == 7 {
            self.phoneTxtFld.text! += ")"
        }
    }
    
    @IBOutlet weak var vhodBtn: UIButton!
    @IBOutlet weak var registrationBtn: UIButton!
    @IBOutlet weak var phoneTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    var telError = false, pasError = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTxtFld.delegate = self
        vhodBtn.layer.cornerRadius = vhodBtn.frame.size.height / 4
        registrationBtn.layer.cornerRadius = registrationBtn.frame.size.height / 4
        
        
        
        
    }
    
    @IBAction func LogInBtn(_ sender: Any) {
        if phoneTxtFld.text == "" {
            errorBorder(textField: phoneTxtFld)
            telError = true
        }
        else {
            telError = false
        }
        if passwordTxtFld.text == ""{
            errorBorder(textField: passwordTxtFld)
            pasError = true
        }
        else {
            pasError = false
        }
        if phoneTxtFld.text != "" && passwordTxtFld.text != "" {
            admin()
        }
        alert()
    }
    
    
    //MARK: ALETRT
    func alert() {
        if telError == true && pasError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели номер телефона и пароль", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if telError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели номер телефона", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if pasError == true {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы не ввели пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //MARK: STOP EMPTY
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in:currentText) else {
            return false
        }
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count < 12
        
    }
    
    //MARK: SIGN IN ADMIN
    func admin() {
        if phoneTxtFld.text == "99999999999" && passwordTxtFld.text == "admin" {
            performSegue(withIdentifier: "carSegue", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Ошибка!", message: "Неправильный номер или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //MARK:ERROR BORDER
    public func errorBorder(textField: UITextField) {
        textField.layer.cornerRadius = textField.frame.size.height / 4
        //textField.layer.borderWidth = 2
        //textField.layer.borderColor =  UIColor.red.cgColor
    }
}

//MARK: Phone TEXTFIELD CHANGE



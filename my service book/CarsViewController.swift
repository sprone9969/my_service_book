//
//  CarsViewController.swift
//  my service book
//
//  Created by Умид Халилов on 04.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class CarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser()
        {
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! cars2ViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
}

class Core{
    
    static let shared = Core()

    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setInNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

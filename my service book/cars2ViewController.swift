//
//  cars2ViewController.swift
//  my service book
//
//  Created by Умид Халилов on 05.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import UIKit

class cars2ViewController: UIViewController {
    
    @IBOutlet var holderView: UIView! // виев для скрола вбок
    let scrollView = UIScrollView() // скрол вбок
    @IBOutlet var informationView: UIView! // виев вниз
    let scrollDownView = UIScrollView() // скрол вниз
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        selectCars()

    }
    
     func carInformation(){
        scrollDownView.frame = holderView.bounds
        informationView.addSubview(scrollView)
        for x in 0..<2 {
            let pageDownView = UIView(frame: CGRect(x: 0, y: CGFloat(x) * informationView.frame.size.height, width: informationView.frame.size.width, height: informationView.frame.size.height)) // задаем размеры нашего виев
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: pageDownView.frame.size.width-20, height: 120))

            label.textAlignment = .center
            label.font = UIFont(name: "Roboto-Black.ttf", size: 22)
            pageDownView.addSubview(label)
            label.text = "Test"

            //        let button = UIButton(frame: CGRect(x: pageView.frame.size.width - 116 , y: 22, width: 100, height: 50))
        }
        scrollDownView.contentSize = CGSize(width: 0, height: holderView.frame.size.height*2) //размер нашего скролла
        scrollDownView.isPagingEnabled = true
    }
    
    private func selectCars(){
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let title = ["Машина1", "Машина2", "Машина3", "Добавить"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            // Title, button, image
            //задаем позиции для наших outlet
            let label = UILabel(frame: CGRect(x: 10, y: -10, width: pageView.frame.size.width-20, height: 120))
            
            let button = UIButton(frame: CGRect(x: pageView.frame.size.width - 116 , y: 22, width: 100, height: 50)) //кнопка сдвига вправо
            let buttonBack = UIButton(frame: CGRect(x: 16 , y: 22, width: 100, height: 50)) //кнопка сдвига влева
            let buttonAddService = UIButton(frame: CGRect(x: 5, y: (pageView.frame.size.height) - 70, width: (pageView.frame.size.width) - 10, height: 50)) // кнопка добавления события
            label.textAlignment = .center
            label.font = UIFont(name: "Roboto-Black.ttf", size: 22)
            pageView.addSubview(label)
            label.text = title[x]
//            carInformation()
            
            //            imageView.contentMode = .scaleAspectFit
            //            imageView.image = UIImage(named: "welcome_\(x)")
            //            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.titleLabel?.font = UIFont(name: "Roboto", size: 18)
            buttonAddService.backgroundColor = .black
            buttonAddService.setTitle("Добавить", for: .normal)
            
            button.layer.cornerRadius = button.frame.size.height / 4
            buttonBack.layer.cornerRadius = button.frame.size.height / 4
            buttonAddService.layer.cornerRadius = buttonAddService.frame.size.height / 4
            
            if x == 0 {
                button.setTitle(title[x + 1], for: .normal)
            }
            else{
                button.setTitle(title[x + 1], for: .normal)
                buttonBack.setTitle(title[x - 1], for: .normal)
                buttonBack.setTitleColor(.white, for: .normal) // задаем цвет текста кнопки
                buttonBack.backgroundColor = .black // задаем цвет заливки кнопки
            }
            
            button.addTarget(self, action: #selector(didtapButton(_:)), for: .touchUpInside) // при нажатие скролит вправо
            
            buttonBack.addTarget(self, action: #selector(didtapButton(_:)), for: .touchUpInside) // при нажатие скролит вправо
            
            button.tag = x + 1
            pageView.addSubview(button)
            pageView.addSubview(buttonBack)
            pageView.addSubview(buttonAddService)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0) //размер нашего скролла
        scrollView.isPagingEnabled = true
        
        
    }
    
    @objc func didtapButton(_ button: UIButton){
        
        guard button.tag < 3 else { // число 3 означает, сколько окон у нас будет
            return
        }
        
        // scroll на следущую страницу
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
        
    }
 
 
}

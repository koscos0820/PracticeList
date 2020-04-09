//
//  Tetoris.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/18.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class Tetoris: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
    
        
        let backView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor.clear
        self.view.addSubview(backView)
        
        //NSLayoutConstrainクラスにて制約をつける
        backView.widthAnchor.constraint(equalToConstant: 414).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        backView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        let whiteView1 = UIView.init(frame: CGRect.init(x: 162, y: 45, width: 90, height: 90))
        whiteView1.backgroundColor = UIColor.white
        backView.addSubview(whiteView1)
        whiteView1.addSubview(blueView())
        
        
        
        let whiteView2 = UIView.init(frame: CGRect.init(x: 72, y: 45, width: 90, height: 90))
        whiteView2.backgroundColor = UIColor.white
        backView.addSubview(whiteView2)
        whiteView2.addSubview(blueView())
        
        let whiteView3 = UIView.init(frame: CGRect.init(x: 162, y: 135, width: 90, height: 90))
        whiteView3.backgroundColor = UIColor.white
        backView.addSubview(whiteView3)
        whiteView3.addSubview(blueView())
        
        let whiteView4 = UIView.init(frame: CGRect.init(x: 252, y: 135, width: 90, height: 90))
        whiteView4.backgroundColor = UIColor.white
        backView.addSubview(whiteView4)
        whiteView4.addSubview(blueView())
                
    }
    
    func blueView() -> UIView {
        let blue = UIView.init(frame: CGRect.init(x: 5, y: 5, width: 80, height: 80))
        blue.backgroundColor = UIColor.blue
        return blue
    }
    
//    extension UIColor {
//        class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
//
//        }
//    }
}

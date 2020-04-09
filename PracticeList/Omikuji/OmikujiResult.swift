//
//  OmikujiResult.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/16.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class OmikujiResult: UIViewController{
    
        
    @IBOutlet weak var resultImage: UIImageView!
    
    var stage: Stage = .nomal
    
    override func viewDidLoad() {
        super .viewDidLoad()
        resultImage.image = UIImage(named: "\(getOmikuji())")
    }
    
    enum Stage: Int {
        case tengoku = 0
        case nomal = 1
        case zigoku = 2
    }
    
    private func getOmikuji() -> String {
        let randomNum = Int.random(in: 1...100)
        switch stage {
        case .tengoku:
            switch randomNum {
            case 1...40:
                return "omikuji_daikichi"
            case 41...60:
                return "omikuji_chuukichi"
            case 61...70:
                return "omikuji_kichi"
            case 71...80:
                return "omikuji_syoukichi"
            case 81...90:
                return "omikuji_suekichi"
            case 91...95:
                return "omikuji_kyou"
            default:
                return "omikuji_daikyou"
            }
        case .nomal:
            switch randomNum {
            case 1...15:
                return "omikuji_daikichi"
            case 16...30:
                return "omikuji_chuukichi"
            case 31...45:
                return "omikuji_kichi"
            case 46...60:
                return "omikuji_syoukichi"
            case 61...75:
                return "omikuji_suekichi"
            case 76...90:
                return "omikuji_kyou"
            default:
                return "omikuji_daikyou"
            }
        case .zigoku:
            switch randomNum {
            case 1...5:
                return "omikuji_daikichi"
            case 6...10:
                return "omikuji_chuukichi"
            case 11...20:
                return "omikuji_kichi"
            case 21...30:
                return "omikuji_syoukichi"
            case 31...40:
                return "omikuji_suekichi"
            case 41...60:
                return "omikuji_kyou"
            default:
                return "omikuji_daikyou"
            }
        }
    }
}

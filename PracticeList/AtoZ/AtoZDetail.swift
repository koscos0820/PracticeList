//
//  AtoZDetail.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/17.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class AtoZDetail: UIViewController {
    
    @IBOutlet private weak var detailLabel: UILabel!
    
    var selectAlphabet: Alphabet = .A
    
    enum Alphabet: String {
        case A
        case B
        case C
        case D
        case E
        case F
        case G
        case H
        case I
        case J
        case K
        case L
        case M
        case N
        case O
        case P
        case Q
        case R
        case S
        case T
        case U
        case V
        case W
        case X
        case Y
        case Z
    
        func getAnimalName() -> String {
            switch self {
            case .A:
                return "Alpaca"
            case .B:
                return "Bear"
            case .C:
                return "Cat"
            case .D:
                return "Duck"
            case .E:
                return "Elephant"
            case .F:
                return "Fish"
            case .G:
                return "Gorilla"
            case .H:
                return "Horse"
            case .I:
                return "Inu"
            case .J:
                return "Jaguar"
            case .K:
                return "Koala"
            case .L:
                return "Lamb"
            case .M:
                return "Mouse"
            case .N:
                return "Newt"
            case .O:
                return "Octopus"
            case .P:
                return "Panda"
            case .Q:
                return "Quail"
            case .R:
                return "Rabbit"
            case .S:
                return "Squid"
            case .T:
                return "Tigar"
            case .U:
                return "Uguisu"
            case .V:
                return "Vulture"
            case .W:
                return "Wolf"
            case .X:
                return "xiphias"
            case .Y:
                return "Yak"
            case .Z:
                return "Zebra"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = selectAlphabet.getAnimalName()
    }
}

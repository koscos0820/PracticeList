//
//  TetoView.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/19.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class TetoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        //fatalErrorがデフォルトで入っていますが消さないとエラーになってしまうので注意してください！
    }
    
    func loadNib() {
        //CustomViewの部分は各自作成したXibの名前に書き換えてください
        let view = Bundle.main.loadNibNamed("TetoView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}

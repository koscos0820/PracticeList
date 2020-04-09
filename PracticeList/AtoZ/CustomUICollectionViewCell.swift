//
//  CustomUICollectionViewCell.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/17.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class CustomUICollectionViewCell : UICollectionViewCell{

    var textLabel : UILabel?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        // UILabelを生成.
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        textLabel?.backgroundColor = UIColor.orange
        textLabel?.textAlignment = NSTextAlignment.center

        // collectioncellに追加.
        self.contentView.addSubview(textLabel!)
    }

}

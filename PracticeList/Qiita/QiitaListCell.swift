//
//  QiitaListCell.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/05/11.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class QiitaListCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.kf.cancelDownloadTask()
        imageView?.image = nil
    }
    
}

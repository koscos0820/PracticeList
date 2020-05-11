//
//  QiitaListViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/31.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD
import Kingfisher

class QiitaListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let segueName = "toDetail"
    private let cellIdentifier = "MyCell"
    
    var articles: [QiitaStruct] = []
    
    @IBOutlet private weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(QiitaListCell.self, forCellReuseIdentifier: cellIdentifier)
        QiitaViewModel().fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.listTableView.reloadData()
                SVProgressHUD.dismiss()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard let detailObject = segue.destination as? QiitaDetailViewController,
                let selectedArticle = sender as? QiitaStruct else { fatalError() }
            detailObject.selectedArticle = selectedArticle
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = QiitaListCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.name
        
        // イメージの取得
        guard let urlString = article.user.profile_image_url else {
            cell.imageView?.image = UIImage(named: "no_image_square")
            return cell
        }
        
        cell.imageView?.kf.setImage(with: URL(string: urlString),
                                    completionHandler: { result in
                        cell.setNeedsLayout()
                    }
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedArticle = articles[indexPath.row]
        // 別の画面に遷移
        performSegue(withIdentifier: segueName, sender: selectedArticle)
    }
}




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

class QiitaListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let segueName = "toDetail"
    private let cellIdentifier = "MyCell"
    
    var articles: [QiitaStruct] = []
    
    @IBOutlet private weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
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
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.name
        // イメージの取得
        if let urlString = article.user.profile_image_url {
            let url = URL(string: urlString)
            
            do{
                let imageData = try Data(contentsOf: url!)
                cell.imageView?.image = UIImage(data: imageData)
            } catch {
                cell.imageView?.image = UIImage(named: "no_image_square")
            }
        }
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


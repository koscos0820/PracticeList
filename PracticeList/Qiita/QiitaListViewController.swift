//
//  QiitaListViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/31.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//


import UIKit
import Foundation

struct QiitaViewModel {
    
    static func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {
        // json受け取り
        let url = "https://qiita.com/api/v2/tags/swift/items"
        
        guard var urlComponents = URLComponents(string: url) else {return}
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "20"),
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {(data, response, error) in
            
            guard let jsonData = data else {return}
            
            do{
                let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
                
                completion(articles)
                
            } catch let jsonError{
                print("error", jsonError)
            }
        }
        task.resume()
    }
}

class QiitaListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let listCells = ["aaa"]
    let segueName = "toDetail"
    let cellIdentifier = "MyCell"
    
    var articles: [QiitaStruct] = []
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        QiitaViewModel.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        })

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            let detailObject = segue.destination as! QiitaDetailViewController
            detailObject.url = sender as! String
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
        if let urlString = article.user.profile_image_url as? String {
            let url = URL(string: urlString)

            do{
                let imageData = try Data(contentsOf: url!)
                cell.imageView?.image = UIImage(data: imageData)
            } catch {
                print("Error : Cat't get image")
            }
        } else {
            cell.imageView?.image = UIImage(named: "omikuji_daikichi") //nilの場合は固定画像表示
        }
        

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        var selectUrl = articles[indexPath.row].url
        // 別の画面に遷移
        performSegue(withIdentifier: segueName, sender: selectUrl)
    }

}


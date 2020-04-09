//
//  QiitaMainViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/31.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//


import UIKit

class QiitaMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topTableView: UITableView!
    
    let tableCells = ["Qiita"]
    let segueNames = ["toList"]
    let cellIdentifier = "TopCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topTableView.delegate = self
        topTableView.dataSource = self
        
        topTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    
    @IBAction func returnButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tableCells[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        // 別の画面に遷移
        performSegue(withIdentifier: segueNames[indexPath.row], sender: nil)
    }


}

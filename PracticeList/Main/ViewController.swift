//
//  ViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/13.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var practiceListTable: UITableView!

    private let listArray = ["九九", "おみくじ", "AtoZ", "Tetoris", "Qiita"]
    private let segues = ["toKukuList", "toOmikuji", "toAtoZ", "toTetoris", "toQiita"]
    private let cellName = "MyCell"
    private let sectionTitle = "PracticeList"
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        practiceListTable.delegate = self
        practiceListTable.dataSource = self
        practiceListTable.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(listArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  sectionTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: segues[indexPath.row], sender: nil)
    }
}


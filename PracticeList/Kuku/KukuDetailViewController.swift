//
//  KukuViewController2.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/13.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class KukuDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var kukuDetailTable: UITableView!
    //セルの名前
    private let cellIdentifier = "MyCell"
    //段の数値を格納する変数
    private var stepNumber = Int()
    //〜の段の計算式を格納する配列変数
    private var kukuDetailArray: [String] = []
    //遷移時に渡された値の受け取り
    var sendCellNumber = Int()
    var sendSectionNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kukuDetailTable.delegate = self
        kukuDetailTable.dataSource = self
        //Cellに名前を登録する
        kukuDetailTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        //計算式格納
        createKukuDetailArray(sendCellNumber, sendSectionNumber)
    }
    
    @IBAction private func returnButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //九九の計算式配列の作成、格納
    private func createKukuDetailArray(_ sendCellNumber: Int, _ sendSessionNumber: Int) {
        for multipleNumber in 1...9 {
            stepNumber = sendCellNumber + 1 + sendSessionNumber * 10
            let anwerNumber = stepNumber * multipleNumber
            kukuDetailArray.append("\(stepNumber) × \(multipleNumber) = \(anwerNumber)")
        }
    }
    
    //セル数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kukuDetailArray.count
    }
    
    //セルの情報を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "\(kukuDetailArray[indexPath.row])"
        return cell
    }
    
    //セクションの名を返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(stepNumber)の段"
    }
}

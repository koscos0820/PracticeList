//
//  KukuViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/13.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class KukuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var kukuTable: UITableView!
    // 表示する段の最大値
    private let maxMlutiplyCount = 99
    /// セルの名前
    private let cellIdentifier = "MyCell"
    // Segueの名前
    private let segueName = "toDetail"
    //セクション名を格納する配列
    private var sectionNames: [String] = []
    //セルにあたる値を格納する配列
    private var steps: [[String]] = []
    //選択されたセルの行とセクションを格納する変数
    private var selectRow = Int()
    private var selectSection = Int()
    
    private var tableData: [TableData] = []
    
    struct TableData {
        let sectionName: String
        let steps: [String]
    }
    
    @IBAction private func returnButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSectionArray()
        kukuTable.delegate = self
        kukuTable.dataSource = self
        
        //Cellに名前を登録する
        kukuTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    //画面遷移時にクリックされたセルのセッション、行数を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            let svc = segue.destination as! KukuDetailViewController
            svc.sendCellNumber = selectRow
            svc.sendSectionNumber = selectSection
        }
    }

    //セクションに該当する配列の生成
    private func createSectionArray() {
        var first = 1
        var last = 10
        let loopCount = maxMlutiplyCount % 10 == 0 ? maxMlutiplyCount / 10 - 1 : maxMlutiplyCount / 10
        for _ in 0...loopCount {
            tableData.append(TableData(sectionName: "\(first)~\(last)", steps: createStepArray(first, last)))
            sectionNames.append("\(first)~\(last)")
            steps.append(createStepArray(first, last))
            first += 10
            last = last + 10 < maxMlutiplyCount ? last + 10 : maxMlutiplyCount
        }
    }
    
    //セルとなる配列を返す
    private func createStepArray(_ minMultipleNumber: Int, _ maxMultipleNumber: Int) -> [String] {
        var arraySteps: [String] = []
        for index in minMultipleNumber...maxMultipleNumber {
            arraySteps.append("\(index)の段")
        }
        return arraySteps
    }
    
    
    //セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    // MARK: - tableView

    //Cellに表示する値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tableData[indexPath.section].steps[indexPath.row]
        return cell
    }
    
    //セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  tableData[section].sectionName
    }
    
    //セクションごとに表示するセル数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps[section].count
    }
    
    // タップされたセルの行番号の取得
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRow = indexPath.row
        selectSection = indexPath.section
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        // 別の画面に遷移
        performSegue(withIdentifier: segueName, sender: nil)
    }
}

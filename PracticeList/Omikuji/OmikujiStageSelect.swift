//
//  OmikujiStageSelect.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/16.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class OmikujiStageSelect: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private weak var selectStage: UITableView!
    
    private let stages = ["天国", "通常", "地獄"]
    private let cellName = "MyCell"
    private let segueName = "toResult"
    private let stageTitle = "ステージ選択"
    
//    private var selectCellRow: Int!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectStage.delegate = self
        selectStage.dataSource = self
        selectStage.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            let omikujiResultObj = segue.destination as! OmikujiResult
            if let stage = sender as? OmikujiResult.Stage {
                omikujiResultObj.stage = stage
            }
        }
    }

    @IBAction private func closeOmikuji(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        cell.textLabel?.text = stages[indexPath.row]
        return cell
    }
    
    //セクションのタイトルを返す
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  stageTitle
    }
    
    // タップされたセルの行番号の取得
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let stage = OmikujiResult.Stage(rawValue: indexPath.row) else {
            return
        }
        
        // 別の画面に遷移
        performSegue(withIdentifier: segueName, sender: stage)
    }
    
}

//
//  AtoZList.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/16.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

class AtoZList: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    private let segueName = "toDetail"
    
    private let cellName = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width:50, height:50)
        
        // collectionViewに使われるクラスを登録
        collectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: cellName)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // 遷移する際の値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        // セグエの名前があっていれば、データの受け渡しを行う
        if segue.identifier == segueName {
            let detailObj = segue.destination as! AtoZDetail
            // senderの値をAaphabet型にキャスト出来たら(nilにならなければ)DetailのselectAlphabetに値を送る
            if let selectAlphabet = sender as? AtoZDetail.Alphabet {
                detailObj.selectAlphabet = selectAlphabet
            }
        }
    }
    
    @IBAction private func closeButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - collectionView
    
    // セクション内のアイテムの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alphabet.count
    }

    // アイテムの値を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // アイテムをカスタムクラス型で初期化
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CustomUICollectionViewCell
        // クラスメソッドを利用して文字列を格納
        cell.textLabel?.text = alphabet[indexPath.row]
        
        return cell
    }
    
    // アイテム が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // nilの場合、代入されず遷移は行われない
        guard let selectAlphabet = AtoZDetail.Alphabet(rawValue: alphabet[indexPath.row]) else {
            return
        }
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: segueName, sender: selectAlphabet)        
    }
}

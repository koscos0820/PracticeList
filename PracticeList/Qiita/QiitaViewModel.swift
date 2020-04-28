//
//  QiitaViewModel.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/04/09.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import Foundation
import SVProgressHUD

struct QiitaViewModel {
    
    func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {
        // json受け取り
        let apiUrlStr = "https://qiita.com/api/v2/tags/swift/items"
        
        guard let urlComponents = URLComponents(string: apiUrlStr) else { return }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                SVProgressHUD.dismiss()
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
                completion(articles)
            } catch let jsonError {
                SVProgressHUD.dismiss()
                print("error", jsonError)
            }
        }
        SVProgressHUD.show()
        task.resume()
    }
}

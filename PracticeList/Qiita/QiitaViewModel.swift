//
//  QiitaViewModel.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/04/09.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import Foundation

struct QiitaViewModel {
    
    func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {
        // json受け取り
        let url = "https://qiita.com/api/v2/tags/swift/items"
        
        guard var urlComponents = URLComponents(string: url) else {return}
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "20")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            
            guard let jsonData = data else { fatalError() }
            
            do{
                let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
                completion(articles)
            } catch let jsonError {
                print("error", jsonError)
            }
        }
        task.resume()
    }
}

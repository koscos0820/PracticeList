//
//  QiitaDetailViewController.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/31.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit
import WebKit

class QiitaDetailViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var url = "https://www.google.com/"
    
    
    @IBOutlet weak var viewUnderWeb: UIView!

    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        let urlString = url
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        
        webView.load(request as URLRequest)
        
        viewUnderWeb = webView
        
        // プログレスバー
        progressBar.progress = 0.2// 進捗セット(0.0~1.0)
        self.view.addSubview(progressBar)//viewに追加
        
    }
    
    

    @IBAction func redo(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func undo(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func actionButton(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [webView!], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func refleshButton(_ sender: Any) {
        webView.reload()
    }
    
}

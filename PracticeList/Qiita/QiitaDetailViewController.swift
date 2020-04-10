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
    
    var progressView = UIProgressView()
        
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //監視の設定
        self.webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        //プログレスバーを生成(NavigationBar下)
        progressView = UIProgressView(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.size.height - 2, width: self.view.frame.size.width, height: 10))
        progressView.progressViewStyle = .bar
        
        self.navigationItem.title = "Title"
        
        self.navigationController?.navigationBar.addSubview(progressView)
        
        load(url: url)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            //estimatedProgressが変更されたときに、setProgressを使ってプログレスバーの値を変更する。
            self.progressView.setProgress(Float(self.webView.estimatedProgress), animated: true)
        }else if keyPath == "loading"{
            UIApplication.shared.isNetworkActivityIndicatorVisible = self.webView.isLoading
            if self.webView.isLoading {
                self.progressView.setProgress(0.1, animated: true)
            }else{
                //読み込みが終わったら0に
                self.progressView.setProgress(0.0, animated: false)
            }
        }
    }
    
    private func load(url: String) {
        // 表示するWEBサイトのURLを設定します。
        let url = URL(string: url)
        let urlRequest = URLRequest(url: url!)
        // webViewで表示するWEBサイトの読み込みを開始します。
        webView.load(urlRequest)
    }
    
    deinit{
        //監視の解除
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView.removeObserver(self, forKeyPath: "loading")
    }
    
    @IBAction private func redo(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction private func undo(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction private func actionButton(_ sender: Any) {
        let controller = UIActivityViewController(activityItems: [webView!], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func refleshButton(_ sender: Any) {
        webView.reload()
    }

}

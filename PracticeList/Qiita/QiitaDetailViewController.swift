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
    
    var selectedArticle: QiitaStruct?
    
    private var progressView = UIProgressView(progressViewStyle: .bar)
    
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = selectedArticle?.url,
            let selectedUrl = URL(string: urlString) else { fatalError() }
        
        setupProgressView()
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(URLRequest(url: selectedUrl))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { fatalError() }
        
        switch keyPath {
        case #keyPath(WKWebView.isLoading):
            if webView.isLoading {
                progressView.alpha = 1.0
                progressView.setProgress(0.1, animated: true)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.progressView.alpha = 0.0
                }, completion: { _ in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        case #keyPath(WKWebView.estimatedProgress):
            self.progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        default:
            break
        }
    }
    
    private func setupProgressView() {
        guard let navigationBarH = navigationController?.navigationBar.frame.size.height else { fatalError() }
        progressView = UIProgressView(frame: CGRect(x: 0,
                                                    y: navigationBarH,
                                                    width: self.view.frame.size.width,
                                                    height: 0))
        navigationController?.navigationBar.addSubview(progressView)
        //変更を検知
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    @IBAction private func redo(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction private func undo(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction private func actionButton(_ sender: Any) {
        guard let shareText = selectedArticle?.title,
            let urlString = selectedArticle?.url,
            let shareUrl = URL(string: urlString) else { fatalError() }
        let controller = UIActivityViewController(activityItems: [shareText, shareUrl], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction private func refleshButton(_ sender: Any) {
        webView.reload()
    }
}

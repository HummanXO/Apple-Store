//
//  productViewController.swift
//  Apple Store
//
//  Created by Alexandr on 31/01/2025.
//  Copyright © 2025 Alexandr. All rights reserved.
//

import UIKit
import WebKit

class productViewController: UIViewController {
    var webView : WKWebView!
    var t = String()
    var loadURL = String()
    
    let toolBar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        let webViewConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        view = webView
        if let myURL = URL(string: loadURL) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
        setupLayouts()
        setupToolBar()
    }
    
    func setupLayouts() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
        
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupToolBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backPressed))
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(forwardPressed))
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonTapped))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [backButton, flexibleSpace, forwardButton, flexibleSpace, refreshButton, flexibleSpace, shareButton]
        
    }
    @objc func backPressed() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @objc func forwardPressed() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    @objc func refreshButtonTapped() {
        webView.reload()
    }

    @objc func shareButtonTapped() {
        guard let url = webView.url else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }

}

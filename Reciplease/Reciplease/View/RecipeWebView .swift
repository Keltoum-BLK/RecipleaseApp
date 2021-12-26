//
//  RecipeWebView .swift
//  Reciplease
//
//  Created by Kel_Jellysh on 23/12/2021.
//

import Foundation
import UIKit
import WebKit

class RecipeWebView: UIView, WKNavigationDelegate {
    
    private var webPage: WKWebView = {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    //MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }
  
    
    private func configureSubviews() {
        backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        webPage.navigationDelegate = self
        guard let url = URL(string: "https://www.google.com") else { return }
        webPage.load(URLRequest(url: url))
        addSubview(webPage)
    }
    
    private func setUpContraints() {
       
        webPage.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        webPage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        webPage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        webPage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        webPage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
}



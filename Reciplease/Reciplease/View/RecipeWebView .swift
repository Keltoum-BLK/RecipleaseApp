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
    
    var webPage: WKWebView = {
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
        addSubview(webPage)
    }
    
    private func setUpContraints() {
       
        webPage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        webPage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        webPage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        webPage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        webPage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
}



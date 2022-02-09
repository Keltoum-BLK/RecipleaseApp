//
//  RecipeWebPageVC.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 23/12/2021.
//

import UIKit
import WebKit

class RecipeWebPageVC: UIViewController, WKNavigationDelegate {
    
    //MARK: property
    let recipeWebPage = RecipeWebView()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeWebPage.webPage.navigationDelegate = self
        view = recipeWebPage
        title = "Reciplease"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        recipeWebPage.webPage.stopLoading()
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
//        decisionHandler(.allow)
//    }
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
//        decisionHandler(.allow)
//    }
   
}





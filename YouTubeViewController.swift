//
//  YouTubeViewController.swift
//  SportsApp
//
//  Created by Mina Hany on 3/28/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import WebKit
class YouTubeViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    var linkYoutube : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self
            view = webView
        let url = (URL(string: "https://\(linkYoutube ?? "")") ?? URL(string: ""))!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
       
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

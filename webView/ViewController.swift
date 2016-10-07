//
//  ViewController.swift
//  webView
//
//  Created by LaoTao on 16/4/28.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var refreshImage: UIImageView!
    
    var refreshAgain = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: "http://blog.devtao.com")
        let url = NSURL(string: "https://app.cim120.com/?token=bf4c12f31f924e5cad8c69e387573509")
        let request = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 0)
        webView.delegate = self
        webView.loadRequest(request)
    }

    @IBAction func fallBack(sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForward(sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func stop(sender: UIButton) {
        if webView.loading {
            webView.stopLoading()
            
        }
        refreshAgain = false
        refreshImage.hidden = true
    }
    
    @IBAction func refreshCantStop(sender: UIButton) {
        refreshAgain = true
        refreshWebView()
    }
    
    func refreshWebView()  {
        if refreshAgain {
            self.performSelector(#selector(ViewController.refreshWebView), withObject: nil, afterDelay: 2)
        }
        webView.reload()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        refreshImage.hidden = false
        return true
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        refreshImage.hidden = true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


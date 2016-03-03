//
//  ViewController.swift
//  UIWebViewCustomHTTPHeader
//
//  Created by Masayoshi Ukida on 3/3/16.
//  Copyright © 2016 Masayoshi Ukida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var webView: UIWebView?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://coordinates.jp")
        let request = NSURLRequest(URL: url!)
        self.webView?.delegate = self;
        self.webView?.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIWebViewDelegate {
    func uiWebView(sender: UIWebView!,
        resource identifier: AnyObject!,
        willSendRequest request: NSURLRequest!,
        redirectResponse: NSURLResponse!,
        fromDataSource dataSource: AnyObject!) -> NSURLRequest! {
            
        let mutableRequest = request.mutableCopy() as! NSMutableURLRequest
        mutableRequest.setValue("xxx", forHTTPHeaderField: "X-Header")
        
        return mutableRequest
    }
}
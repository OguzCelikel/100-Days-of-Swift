//
//  ViewController.swift
//  Project4
//
//  Created by Ömer Oğuz Çelikel on 4.02.2022.
//

import UIKit
import WebKit
/*
when we say class A: B we’re defining a new class called A that builds on the functionality provided by class B. However, when we say class A: B, C we’re saying it inherits from UIViewController (the first item in the list), and promises it implements the WKNavigationDelegate protocol.

 The order here really is important: the parent class (superclass) comes first, then all protocols implemented come next, all separated by commas. We're saying that we conform to only one protocol here (WKNavigationDelegate) but you can specify as many as you need to.
 */
class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    //create the progress view
    var progressView: UIProgressView!
    
    var websites = ["omercelikel.com", "apple.com", "hackingwithswift.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url =  URL(string: "https://omercelikel.com")!
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        
        /*
         The first line creates a new UIProgressView instance, giving it the default style. There is an alternative style called .bar, which doesn't draw an unfilled line to show the extent of the progress view, but the default style looks best here.
         The second line tells the progress view to set its layout size so that it fits its contents fully.
         The last line creates a new UIBarButtonItem using the customView parameter, which is where we wrap up our UIProgressView in a UIBarButtonItem so that it can go into our toolbar.
         */
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // creates a flexible space
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //Challenge 2
        let goBack = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let goForward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        // creates an array containing the flexible space and the refresh button, then sets it to be our view controller's toolbarItems array.
        toolbarItems = [progressButton, spacer, goBack, goForward, refresh]
        // sets the navigation controller's isToolbarHidden property to be false, so the toolbar will be shown
        navigationController?.isToolbarHidden = false

        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
   
        let url = URL(string: "https://" + websites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        
        /*
         ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
         ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
         ac.addAction(UIAlertAction(title: "omercelikel.com", style: .default, handler: openPage))
         */
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        //setting the alert controller’s popoverPresentationController?.barButtonItem property is used only on iPad, and tells iOS where it should make the action sheet be anchored.
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    //method does is use the title property of the action (apple.com, hackingwithswift.com), put "https://" in front of it to satisfy App Transport Security, then construct a URL out of it.
    func openPage(action: UIAlertAction) {
        guard let actionTiltle = action.title else { return }
        guard let url = URL(string: "https://" + actionTiltle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    //update our view controller's title property to be the title of the web view
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    //This tells you when an observed value has changed,
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
                progressView.progress = Float(webView.estimatedProgress)
            }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        /*
         First, we set the constant url to be equal to the URL of the navigation. This is just to make the code clearer.
         Second, we use if let syntax to unwrap the value of the optional url.host. Remember I said that URL does a lot of work for you in parsing URLs properly? Well, here's a good example: this line says, "if there is a host for this URL, pull it out" – and by "host" it means "website domain" like apple.com. Note: we need to unwrap this carefully because not all URLs have hosts.
         Third, we loop through all sites in our safe list, placing the name of the site in the website variable.
         Fourth, we use the contains() String method to see whether each safe website exists somewhere in the host name.
         Fifth, if the website was found then we call the decision handler with a positive response - we want to allow loading.
         Sixth, if the website was found, after calling the decisionHandler we use the return statement. This means "exit the method now."
         Last, if there is no host set, or if we've gone through all the loop and found nothing, we call the decision handler with a negative response: cancel loading.
         */
        let url = navigationAction.request.url
        if let host = url?.host{
            for website in websites {
                if host.contains(website){
                    decisionHandler(.allow)
                    return
                }
            }
        }
        let urlString = url?.absoluteString ?? "Unknown"

        // filter out "about:blank" to avoid unnecessary alerts
        if urlString != "about:blank" {
            // to test this alert: go to hackingwithswift.com, then under the book "swift in sixty seconds" click "buy download"
            let alert = UIAlertController(title: "Unauthorized", message: "Website \"\(urlString)\" is not part of authorized website", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
  
        decisionHandler(.cancel)

        
        
    }
}


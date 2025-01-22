//
//  DetailMovieController.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 04.01.25.
//

import UIKit
import WebKit

class DetailMovieController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    var movieLink = ""
    
    func getMovies() -> URL {
        let url: URL = URL(string: "\(movieLink)")!
        return url
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        let preference = WKWebpagePreferences()
        preference.preferredContentMode = .mobile
        preference.allowsContentJavaScript = true
        
        let configureation = WKWebViewConfiguration()
        configureation.defaultWebpagePreferences = preference
            myWebView.load(URLRequest(url: getMovies()))
    }
    
}

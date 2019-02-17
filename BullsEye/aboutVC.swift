//
//  aboutVC.swift
//  BullsEye
//
//  Created by zeyad on 2/16/19.
//  Copyright © 2019 zeyad. All rights reserved.
//

import UIKit
import WebKit

class aboutVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "BullsEye", ofType: "html")!
        let url = URL(fileURLWithPath: filePath)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

}

//
//  ViewController.swift
//  BuildConfiguration
//
//  Created by Ourangzaib khan on 4/6/17.
//  Copyright © 2017 Ourangzaib khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pubnubSubscribekey: UILabel!
    
    @IBOutlet weak var pubnubPublishKey: UILabel!
    @IBOutlet weak var configUrl: UILabel!
    @IBOutlet weak var stripeKey: UILabel!
    @IBOutlet weak var wowzaKey: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.configUrl.text = kBASE_URL
        self.stripeKey.text = STRIPEKEY
        self.wowzaKey.text  = WOWZAKEY
        self.pubnubPublishKey.text = PUBNUBKEYPUBLISH
        self.pubnubSubscribekey.text = PUBNUBKEYSUBSCRIBE
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


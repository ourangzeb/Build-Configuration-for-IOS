//
//  Constants.swift
//  BuildConfiguration
//
//  Created by Ourangzaib khan on 4/6/17.
//  Copyright © 2017 Ourangzaib khan. All rights reserved.
//

let kBASE_URL : String = {
    print(Config.sharedInstance.configForKey(key: "kBASE_URL"));
    return Config.sharedInstance.configForKey(key: "kBASE_URL")
}()
let STRIPEKEY : String = {
    return Config.sharedInstance.configForCategory(category: "Stripe", andKey: "Publishable Key")
}()

let PUBNUBKEYSUBSCRIBE : String = {
    return Config.sharedInstance.configForCategory(category: "PubNub", andKey: "Publish Key")
}()

let PUBNUBKEYPUBLISH : String = {
    return Config.sharedInstance.configForCategory(category: "PubNub", andKey: "Subscribe Key")
}()


let WOWZAKEY : String = {
    return Config.sharedInstance.configForKey(key: "Wowza");
}()


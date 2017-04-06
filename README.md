# Build-Configuration-for-IOS
Build-Configuration-for-IOS



you would have seen many tutorials but those dont provide a sample project.
I have added a sample project to make you more clear about the code. Often people use variables or info plist to manage their staging urls and keys. I have used build configuration environment so that if you make a build in release Configuration. your automatic values will be se according to release version.



# First step.
Add the variable **"Configuration"** in your info.plist and add value **"$(CONFIGURATION)"** there.

![N|Solid](https://raw.githubusercontent.com/ourangzeb/Build-Configuration-for-IOS/master/images/2.png)


# Second Step.
Add **"Config.plist"** in your project and add your base_url, wowoza, stripe, pubnub or any other key in both **Build** and **Release** environments.
![N|Solid](https://raw.githubusercontent.com/ourangzeb/Build-Configuration-for-IOS/master/images/1.png)


# Third Step.
Make a **Config.swift** file and copy paste the below code there.



```
import Foundation
private let configManagerSharedInstance = ConfigManager()
class Config {
    class var sharedInstance: ConfigManager {
        return configManagerSharedInstance
    }
}
// You can put as much Environment as you need but you make sure you also put these environment in the config.plist file.
enum Environment: String {
    case Debug = "Debug"
    case Production = "Release"
}
class ConfigManager: NSObject {
    private var environment: Environment?
    var config: NSDictionary?
    override init() {
        super.init()
        // Retrieve the current evironment from the main bundle
        if let currentEnvironment = Bundle.main.infoDictionary?["Configuration"] as? String {
            // Store the current environment for later use
            environment = Environment(rawValue: currentEnvironment)

            if let projectConfigPath = Bundle.main.path(forResource: "Config", ofType: "plist") {
                if let projectConfigContents = NSDictionary(contentsOfFile: projectConfigPath) as? Dictionary<String, AnyObject> {
                    config = projectConfigContents[currentEnvironment] as? Dictionary<String, AnyObject> as NSDictionary?
                }
            } else {
                print("config file not found")
            }
        }
    }
    func getCurrentEnvironment() -> Environment? {
        return self.environment
    }
    func configForKey(key: String) -> String {
        return config?[key] as! String
    }
    //It will use to get sub dictionary and their values.
    func configForCategory(category: String, andKey: String) -> String {
        let configuration = config?.value(forKeyPath: category) as! NSDictionary 
        return configuration.value(forKeyPath: andKey) as! String
    }
}
```
# Step Four.
I have also made a file **Constants.swift** in which i have set the varibles using the above code.
```

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
```

# Step 5.

Now you just have to select the environment using edit sceme go into the edit scheme and chose **Build Configuration**
Now when you will run the project you will see this output WRT build configuration in below images.
![N|Solid](https://raw.githubusercontent.com/ourangzeb/Build-Configuration-for-IOS/master/images/4.png)

![N|Solid](https://raw.githubusercontent.com/ourangzeb/Build-Configuration-for-IOS/master/images/3.png)


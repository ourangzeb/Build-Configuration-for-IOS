
import Foundation

private let configManagerSharedInstance = ConfigManager()

class Config {
    class var sharedInstance: ConfigManager {
        return configManagerSharedInstance
    }

}

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

    func configForCategory(category: String, andKey: String) -> String {
        let configuration = config?.value(forKeyPath: category) as! NSDictionary 
        return configuration.value(forKeyPath: andKey) as! String
    }


}

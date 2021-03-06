import CoreData
import UIKit
import CoreLocation

class DefaultSettingsService : SettingsService
{
    //MARK: Fields
    private let installDateKey = "installDate"
    private let lastLocationDateKey = "lastLocationDate"
    private let lastInactiveDateKey = "lastInactiveDate"
    private let canIgnoreLocationPermissionKey = " canIgnoreLocationPermission"
    private let lastAskedForLocationPermissionKey = "lastAskedForLocationPermission"
    
    //MARK: Properties
    var installDate : Date?
    {
        return UserDefaults.standard.object(forKey: installDateKey) as! Date?
    }
    
     var lastInactiveDate : Date?
    {
        return UserDefaults.standard.object(forKey: lastInactiveDateKey) as? Date
    }
    
    var lastLocationDate : Date?
    {
        return UserDefaults.standard.object(forKey: lastLocationDateKey) as! Date?
    }
    
    var hasLocationPermission : Bool
    {
        guard CLLocationManager.locationServicesEnabled() else { return false }
        return CLLocationManager.authorizationStatus() == .authorizedAlways
    }
    
    var hasNotificationPermission : Bool
    {
        let notificationSettings = UIApplication.shared.currentUserNotificationSettings
        return notificationSettings?.types.contains([.alert, .badge]) ?? false
    }
    
    var lastAskedForLocationPermission : Date?
    {
        return UserDefaults.standard.object(forKey: lastAskedForLocationPermissionKey) as! Date?
    }
    
    var canIgnoreLocationPermission : Bool
    {
        return UserDefaults.standard.bool(forKey: canIgnoreLocationPermissionKey)
    }
    
    //MARK: Methods
    func setInstallDate(_ date: Date)
    {
        guard installDate == nil else { return }
        
        UserDefaults.standard.set(date, forKey: installDateKey)
    }
    
    func setLastInactiveDate(_ date: Date?)
    {
        UserDefaults.standard.set(date, forKey: lastInactiveDateKey)
    }
    
    func setLastLocationDate(_ date: Date)
    {
        UserDefaults.standard.set(date, forKey: lastLocationDateKey)
    }
    
    func setLastAskedForLocationPermission(_ date: Date)
    {
        UserDefaults.standard.set(date, forKey: lastAskedForLocationPermissionKey)
    }
    
    func setAllowedLocationPermission()
    {
        UserDefaults.standard.set(true, forKey: canIgnoreLocationPermissionKey)
    }
}

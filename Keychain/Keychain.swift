import Foundation
import Security

open class Keychain
{
  open class func set(_ key: String, value: String) -> Bool
  {
    if let data = value.data(using: String.Encoding.utf8)
    {
      return set(key, value: data)
    }
    
    return false
  }
  
  open class func set(_ key: String, value: Data) -> Bool
  {
    let query = [
      (kSecClass as String)       : kSecClassGenericPassword,
      (kSecAttrAccount as String) : key,
      (kSecValueData as String)   : value
    ] as [String : Any]
    
    SecItemDelete(query as CFDictionary)
    
    return SecItemAdd(query as CFDictionary, nil) == noErr
  }
  
  open class func get(_ key: String) -> NSString?
  {
    if let data = getData(key)
    {
      return NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    }
    
    return nil
  }
  
  open class func getData(_ key: String) -> Data?
  {
    let query = [
      (kSecClass as String)       : kSecClassGenericPassword,
      (kSecAttrAccount as String) : key,
      (kSecReturnData as String)  : kCFBooleanTrue,
      (kSecMatchLimit as String)  : kSecMatchLimitOne
    ] as [String : Any]
    
    var dataTypeRef: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
    
    if status == noErr && dataTypeRef != nil
    {
      return dataTypeRef as? Data
    }
    
    return nil
  }
  
  open class func delete(_ key: String) -> Bool
  {
    let query = [
      (kSecClass as String)       : kSecClassGenericPassword,
      (kSecAttrAccount as String) : key
    ] as [String : Any]
    
    return SecItemDelete(query as CFDictionary) == noErr
  }
  
  open class func clear() -> Bool
  {
    let query = [
      (kSecClass as String): kSecClassGenericPassword
    ]
    
    return SecItemDelete(query as CFDictionary) == noErr
  }
}

//
//  ApiKeys.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

protocol ApiKeysProtocol {
    func valueForAPIKey(named keyname:String) -> String
}

class ApiKeys: ApiKeysProtocol {
    
    func valueForAPIKey(named keyname:String) -> String {
        // 1
        guard let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist") else {
            fatalError("No se pudo encontrar el archivo 'keys.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: keyname) as? String else {
            fatalError("No se pudo encontrar la clave 'api_key' en 'keys.plist'.")
        }
        // 3
        if (value.starts(with: "_")) {
            fatalError("La clave está vacía")
        }
        return value
    }
    
}

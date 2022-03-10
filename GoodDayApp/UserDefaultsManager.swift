//
//  UserDefaultsManager.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/03.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    private let IS_INITIALIZED = "isInitialized"
    private let USER_NAME = "userName"
    
    func getIsInitialized() -> Bool {
        return UserDefaults.standard.bool(forKey: IS_INITIALIZED)
    }
    
    func setUserName(name: String) {
        UserDefaults.standard.set(name, forKey: USER_NAME)
    }
    
    func getUserName() -> String {
        if let userName = UserDefaults.standard.string(forKey: USER_NAME){
            return userName
        }else {
            return ""
        }
    }
}

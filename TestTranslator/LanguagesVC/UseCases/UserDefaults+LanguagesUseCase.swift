//
//  UserDefaults+LanguagesUseCase.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import Foundation

extension UserDefaults: UseDefaultsLanguagesUseCase {
    private enum Keys {
        static let loadTime = "kLastLoadTimeInterval"
    }
    
    func getLoadTime() -> Double {
        return double(forKey: Keys.loadTime)
    }
    
    func setLoadTime(_ time: Double) {
        setValue(time, forKey: Keys.loadTime)
    }
}

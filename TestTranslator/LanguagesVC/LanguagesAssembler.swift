//
//  LanguagesAssembler.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import UIKit

final class LanguagesAssembler {
    
    private init() { }
    
    static func languagesVC(type: LanguageType, delegate: LanguagesVCDelegate) -> LanguagesVC {
        let vc = LanguagesVC.instanceFromStoryboard(sourceStoryboard: .language)
        let vm = LanguagesVM(view: vc,
                             networkService: NetworkService(),
                             languageRepository: LanguageRepository(),
                             ud: UserDefaults.standard)
        vm.type = type
        vm.delegate = delegate
        
        vc.viewModel = vm
        return vc
    }
    
}

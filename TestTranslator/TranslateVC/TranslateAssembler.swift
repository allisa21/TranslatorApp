//
//  TranslateAssembler.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 31.08.24.
//

import UIKit

final class TranslateAssembler {
    private init() {}
    
    static func translateVC() -> TranslateVC {
        let vc = TranslateVC.instanceFromStoryboard()
        let vm = TranslateVM(
            view: vc,
            networkService: NetworkService(),
            translationRepository: TranslationRepository()
        )
        vc.viewModel = vm
        return vc
    }
}

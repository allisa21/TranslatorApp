//
//  HistoryAssembler.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import UIKit

final class HistoryAssembler {
    private init() {}
    
    static func historyVC() -> HistoryVC {
        let vc = HistoryVC.instanceFromStoryboard()
        let vm = HistoryVM(repository: TranslationRepository())
        vc.viewModel = vm
        return vc
    }
    
}

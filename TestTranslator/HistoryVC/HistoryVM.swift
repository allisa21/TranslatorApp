//
//  HistoryVM.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import UIKit

protocol HistoryVMProtocol {
    var items: [TranslationMO] {get}
    func loadHistory()
}

protocol TranslationRepositoryHistoryUseCase {
    func getAll() -> [TranslationMO]
}

final class HistoryVM: HistoryVMProtocol {
  
    private(set)  var items: [TranslationMO] = []
    
    private let repository: TranslationRepositoryHistoryUseCase
    
    init(repository: TranslationRepositoryHistoryUseCase) {
        self.repository = repository
    }
    
    func loadHistory() {
        items = repository.getAll()
    }
    
    
}

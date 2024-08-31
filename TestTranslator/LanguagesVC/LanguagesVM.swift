//
//  LanguagesVM.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import UIKit

protocol LanguagesVMProtocol {
    var languages: [LanguageResponseModel] { get }
    
    func loadData()
    func didSelect(language: LanguageResponseModel)
}

protocol LanguagesVCProtocol: UIViewController {
    func reloadData()
}

protocol NetworkServiceLanguagesUseCase {
    func loadLanguages(completion: @escaping ([LanguageResponseModel]) -> Void)
}

protocol LanguagesRepositoryUseCase {
    func getLanguages() -> [LanguageResponseModel] 
    func save(models: [LanguageResponseModel])
}

protocol UseDefaultsLanguagesUseCase {
    func getLoadTime() -> Double
    func setLoadTime(_ time: Double)
}

final class LanguagesVM: LanguagesVMProtocol {
    
    private(set) var languages: [LanguageResponseModel] = [] {
        didSet {
            view?.reloadData()
        }
    }
    
    private weak var view: LanguagesVCProtocol?
    
    weak var delegate: LanguagesVCDelegate?
    var type: LanguageType = .none
    
    private let networkService: NetworkServiceLanguagesUseCase
    private let languageRepository: LanguagesRepositoryUseCase
    private let ud: UseDefaultsLanguagesUseCase
    
    init(view: LanguagesVCProtocol,
         networkService: NetworkServiceLanguagesUseCase,
         languageRepository: LanguagesRepositoryUseCase,
         ud: UseDefaultsLanguagesUseCase) {
        self.networkService = networkService
        self.languageRepository = languageRepository
        self.ud = ud
        self.view = view
    }
        
    func loadData() {
        let loadTime = ud.getLoadTime()
        let nowTime = Date().timeIntervalSince1970
        let cachedLanguages = languageRepository.getLanguages()
        
        if
            nowTime - loadTime < 24 * 3600,
            !cachedLanguages.isEmpty {
            self.languages = cachedLanguages
        } else {
            networkService.loadLanguages { [weak self] languages in
                self?.languages = languages
                self?.languageRepository.save(models: languages)
                self?.ud.setLoadTime(nowTime)
            }
        }
    }
    
    func didSelect(language: LanguageResponseModel) {
        delegate?.didSelect(language: language, with: type)
    }
    
}

//
//  LanguagesRespnoseModels.swift
//  TestTranslator
//
//  Created by Maksim Dehanov on 21.08.23.
//

import Foundation

struct LanguageResponseModel: Decodable {
    var code: String
    var name: String
}

struct LanguageDataResponseModel: Decodable {
    var languages: [LanguageResponseModel]
}

struct LanguageResponse: Decodable {
    var data: LanguageDataResponseModel
}

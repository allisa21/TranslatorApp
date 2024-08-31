//
//  TranslateResponseModels.swift
//  TestTranslator
//
//  Created by Maksim Dehanov on 21.08.23.
//

import Foundation

struct TranslateResponseModel: Decodable {
    var translatedText: String
}

struct TranslateResponse: Decodable {
    var status: String
    var data: TranslateResponseModel
}

//
//  TranslateVC.swift
//  TestTranslator
//
//  Created by Maksim Dehanov on 24.08.23.
//

import UIKit

final class TranslateVC: UIViewController {
    
    @IBOutlet private weak var sourceButton: UIButton! {
        didSet { sourceButton.setDefaultButtonStyle() }
    }
    @IBOutlet private weak var sourceTextView: UITextView!
    @IBOutlet private weak var targetButton: UIButton! {
        didSet { targetButton.setDefaultButtonStyle() }
    }
    @IBOutlet private weak var targetTextView: UITextView!
    
    var viewModel: TranslateVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func openLanguagesVC(with type: LanguageType) {
        let nextVC = LanguagesAssembler.languagesVC(
            type: type,
            delegate: viewModel.languagesDelegate
        )
        present(nextVC, animated: true)
    }
    
    private func checkValidation() -> Bool {
        guard sourceTextView.hasText
        else {
            sourceTextView.setWarningStyle()
            return false
        }
        sourceTextView.setNoBorderStyle()
        
        guard viewModel.sourceLanguageName != nil
        else {
            sourceButton.setWarningStyle()
            return false
        }
        sourceButton.setDefaultButtonStyle()
        
        guard viewModel.targetLanguageName != nil
        else {
            targetButton.setWarningStyle()
            return false
        }
        targetButton.setDefaultButtonStyle()
        
        return true
    }

    @IBAction private func didSourceButtonTap() {
        openLanguagesVC(with: .source)
    }
    
    @IBAction private func didTargetButtonTap() {
        openLanguagesVC(with: .target)
    }
    
    @IBAction private func didTranslateButtonTap() {
        guard 
            checkValidation(),
            let sourceText = sourceTextView.text
        else { return }
        
        viewModel.tryToTranslate(text: sourceText)
    }
    
    @IBAction private func didOpenHistoryTap() {
        let nextVC = HistoryAssembler.historyVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension TranslateVC: TranslateVCProtocol {
    func reloadData() {
        targetTextView.text = viewModel.translatedText
        
        if let sourceLanguage = viewModel.sourceLanguageName {
            sourceButton.setTitle(sourceLanguage, for: .normal)
        } else {
            sourceButton.setTitle("Select Source Language", for: .normal)
        }
        
        if let targetLanguage = viewModel.targetLanguageName {
            targetButton.setTitle(targetLanguage, for: .normal)
        } else {
            targetButton.setTitle("Select Target Language", for: .normal)
        }
    }
}

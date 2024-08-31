//
//  HistoryVC.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 24.08.23.
//

import UIKit

final class HistoryVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HistoryVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        viewModel.loadHistory()
        
    }
}

extension HistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(TranslationTableViewCell.self)",
            for: indexPath
        ) as! TranslationTableViewCell
        cell.setup(model: viewModel.items[indexPath.row])
        return cell
    }
}

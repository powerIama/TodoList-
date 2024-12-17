//
//  SettingViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            SettingTableViewCell.self,
            forCellReuseIdentifier: Identifiers.settingsTableViewIdentifier.key
        )
        return tableView
    }()
    
    var viewModel: SettingViewModel
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        layout()
    }
    
    func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settingsPages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Identifiers.settingsTableViewIdentifier.key,
            for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        let settings = viewModel.settingsPages[indexPath.item]
        cell.logoLable.text = settings.image
        cell.titleLable.text = settings.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowItem = viewModel.settingsPages[indexPath.item]
        print("The page name is: \(rowItem.title) \(rowItem.image)")
        
        viewModel.presentSettingView() 
    }
}

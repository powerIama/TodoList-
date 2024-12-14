//
//  MainViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(
            MainTableViewCell.self,
            forCellReuseIdentifier: Identifiers.tasksTableViewIdentifier.key
        )
        return table
    }()
    
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo 🏎️"
        view.backgroundColor = .systemBackground
        
        let barButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(barButtonTapped)
        )
        navigationItem.rightBarButtonItem = barButton
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = MainHeaderView(frame: CGRect(
            x: 0,
            y: 0,
            width: 0,
            height: 200)
        )
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    @objc func barButtonTapped() {
        viewModel.presentTaskView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tasksTableViewIdentifier.key, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.todoNameLable.text = "Walk with dog"
        cell.descriptionLable.text = "30 minutes"
        return cell
    }
}

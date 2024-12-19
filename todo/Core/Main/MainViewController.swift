//
//  MainViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(
            MainTableViewCell.self,
            forCellReuseIdentifier: Identifiers.tasksTableViewIdentifier.key
        )
        return table
    }()
    
    private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "task.todo".localized()
        view.backgroundColor = .systemBackground
        
        let rightBarButton = UIBarButtonItem(
            title: "task.new".localized(),
            primaryAction: .init(handler: { _ in
                self.rightBarButtonDidTap()
            })
        )
        
        let leftBarButton = UIBarButtonItem(title: "settings.title".localized(),primaryAction: .init(handler: { _ in
            self.leftBarButtonDidTap()
        }))
        
        navigationItem.rightBarButtonItems = [leftBarButton,rightBarButton]
        
        setUpTableView()
        setupViewModelCallbacks()
    }
    
    private func setupViewModelCallbacks() {
        viewModel.onTasksUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = MainHeaderView(frame: CGRect(
            x: 0,
            y: 0,
            width: 0,
            height: 200), viewModel: viewModel
        )
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    @objc private func rightBarButtonDidTap() {
        viewModel.presentTaskView()
    }
    
    @objc private func leftBarButtonDidTap() {
        viewModel.navigateToSettings()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tasksTableViewIdentifier.key, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        let taskData = viewModel.tasks[indexPath.row]
        cell.configure(
            name: taskData.title ?? "",
            description: taskData.taskDescription ?? ""
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = viewModel.tasks[indexPath.item]
            tableView.beginUpdates()
            viewModel.tasks.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            viewModel.deleteTask(lastTask: taskToDelete)
            tableView.endUpdates()
            
        }
    }
}

//
//  MainHeaderView.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainHeaderView: UIView {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 180, height: 180)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var viewModel: MainViewModel
    
    init(frame: CGRect, viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
        layout()
        self.backgroundColor = .systemBackground
        
        setupBindings()
        collectionView.reloadData()
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(
            IncompletedMainCollectionViewCell.self,
            forCellWithReuseIdentifier: Identifiers.incompletedCollectionIdentifer.key
        )
        collectionView.register(
            CompletedMainCollectionViewCell.self,
            forCellWithReuseIdentifier: Identifiers.completedCollectionIdentifer.key
        )
    }
    
    private func setupBindings() {
        viewModel.$tasks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &viewModel.anyCancellables)
        viewModel.$completedTask
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &viewModel.anyCancellables)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension MainHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.incompletedCollectionIdentifer.key, for: indexPath) as? IncompletedMainCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(totalOfTask: "\(String(viewModel.tasks.count))")
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.completedCollectionIdentifer.key, for: indexPath) as? CompletedMainCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(totalOfTask: "\(String(viewModel.completedTask.count))")
            return cell
        }
    }
}

//
//  CompletedCollectionViewCell.swift
//  todo
//
//  Created by Demian Basistyi on 12/19/24.
//

import Foundation
import UIKit

final class CompletedMainCollectionViewCell: UICollectionViewCell {
    
    private let totalOfTaskNameLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "task.completed".localized()
        lable.font = .systemFont(ofSize: 20, weight: .bold)
        lable.textAlignment = .center
        return lable
    }()
    
    private let totalOfTaskAmountLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 38, weight: .bold)
        lable.textColor = .gray
        lable.textAlignment = .center
        lable.text = "0"
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        configure(totalOfTask: "0")
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func configure(totalOfTask: String?) {
        totalOfTaskAmountLable.text = totalOfTask
    }
    
    func layout() {
        contentView.addSubview(totalOfTaskNameLable)
        contentView.addSubview(totalOfTaskAmountLable)
        NSLayoutConstraint.activate([
            totalOfTaskNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            totalOfTaskNameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalOfTaskNameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            totalOfTaskAmountLable.topAnchor.constraint(equalTo: totalOfTaskNameLable.bottomAnchor, constant: 10),
            totalOfTaskAmountLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalOfTaskAmountLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

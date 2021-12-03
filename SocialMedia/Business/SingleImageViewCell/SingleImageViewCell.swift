//
//  SingleImageViewCell.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 23.11.2021.
//

import UIKit

final class SingleImageViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    func configure(with model: SingleImageViewModel?) {
        guard let viewModel = model else {
            return
        }
        initView(viewModel: viewModel)
    }
    
    private func initView(viewModel: SingleImageViewModel) {
        
        if let iconName = viewModel.iconName, !iconName.isEmpty {
            iconView.isHidden = false
            iconView.image = UIImage(named: iconName)
        }
        
        if let title = viewModel.title {
            titleLabel.text = title
        }
    }
}

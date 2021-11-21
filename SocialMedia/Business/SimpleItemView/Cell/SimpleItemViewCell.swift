//
//  SimpleItemViewCell.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 22.11.2021.
//

import UIKit

final class SimpleItemViewCell: UITableViewCell {
    @IBOutlet private weak var simpleItemView: SimpleItemView!
    
    func configure(with model: SimpleItemViewModel?) {
        simpleItemView?.viewModel = model
    }
}

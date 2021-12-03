//
//  SingleImageViewModel.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 23.11.2021.
//

import UIKit

struct SingleImageViewModel {
    let id: Int?
    let iconName: String?
    let title: String?
    
    init(id: Int? = nil, iconName: String? = nil, title: String? = nil) {
        self.id = id
        self.iconName = iconName
        self.title = title
    }
}

//
//  SimpleItemViewModel.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 21.11.2021.
//

import UIKit

struct SimpleItemViewModel {
    let id: Int?
    let userId: Int?
    let title: String?
    let subTitle: String?
    
    init(id: Int? = nil, userId: Int? = nil, title: String? = nil, subTitle: String? = nil) {
        self.id = id
        self.userId = userId
        self.title = title
        self.subTitle = subTitle
    }
}

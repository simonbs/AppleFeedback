//
//  ListContent.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import Foundation

enum ListContent {
    enum Section: Hashable {
        case parent(ListItem)
    }

    enum Item: Hashable {
        case child(ListItem)
    }
}

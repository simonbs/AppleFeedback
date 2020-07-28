//
//  ListItem.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import Foundation

struct ListItem: Hashable {
    let title: String
    let children: [ListItem]?
}

extension ListItem {
    static func createExampleData() -> [ListItem] {
        return (0...20).map { parentIdx in
            return ListItem(title: "Item \(parentIdx + 1)", children: (0...5).map { childIdx in
                return ListItem(title: "Child \(childIdx + 1)", children: nil)
            })
        }
    }
}

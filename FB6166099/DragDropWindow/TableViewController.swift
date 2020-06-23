//
//  TableViewController.swift
//  DragDropWindow
//
//  Created by Simon Støvring on 18/06/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Foundation
import UIKit

final class TableViewController: UITableViewController {
    private var dragSessionIsRestrictedToDraggingApplication = false

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Drag & Drop Example"
        tableView.dragDelegate = self
        updateToggleButton()
    }
}

private extension TableViewController {
    @objc private func toggleDragSessionIsRestrictedToDraggingApplication() {
        dragSessionIsRestrictedToDraggingApplication = !dragSessionIsRestrictedToDraggingApplication
        updateToggleButton()
    }

    private func updateToggleButton() {
        let title: String
        if dragSessionIsRestrictedToDraggingApplication {
            title = "Set dragSessionIsRestrictedToDraggingApplication = false"
        } else {
            title = "Set dragSessionIsRestrictedToDraggingApplication = true"
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(toggleDragSessionIsRestrictedToDraggingApplication))
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.textLabel?.text = "Drag me to create a new window"
        return cell
    }
}

extension TableViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvider = NSItemProvider(contentsOf: URL(string: "dragdropwindow://"))!
        let dragItem = UIDragItem(itemProvider: itemProvider)
        return [dragItem]
    }

    func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        return dragSessionIsRestrictedToDraggingApplication
    }
}

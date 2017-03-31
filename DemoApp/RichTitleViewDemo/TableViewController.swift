//
//  TableViewController.swift
//  RichTitleView Demo
//
//  Created by Nicolás Miari on 2017/03/31.
//  Copyright © 2017 nicolasmiari. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let titles: [String] = [
        "Short Title",
        "Longer Title",
        "Still Longer Title",
        "Still Very Much Longer Title, I(m Telling You!"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        cell.textLabel?.text = titles[indexPath.row]

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        guard let viewController = segue.destination as? ViewController else {
            return
        }
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        viewController.navigationItem.titleView = RichTitleView(
            title: titles[indexPath.row],
            image: UIImage(named: "TestIcon")
        )
    }

}

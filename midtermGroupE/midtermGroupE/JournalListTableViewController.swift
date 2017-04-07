//
//  JournalListTableViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit

class JournalListTableViewController: UITableViewController {

    var journals: [Journal] = []

    @IBAction func addJournalBtn(_ sender: Any) {
        print("next page")
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "AddJournalsViewController")
        self.present(vc!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()

        JournalManager.shared.getCoreData()
        journals = JournalManager.shared.journals.reversed()
    }

    func setUp() {
        let journalNib = UINib(nibName: JournalTableViewCell.identifier, bundle: nil)
        tableView.register(journalNib, forCellReuseIdentifier: JournalTableViewCell.identifier)
        tableView.separatorStyle = .none

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "JournalTableViewCell", for: indexPath) as? JournalTableViewCell
            else { return UITableViewCell() }

        cell.journalImage.image = UIImage(data: journals[indexPath.row].picture as Data)

        cell.journalTitle.text = journals[indexPath.row].title

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return JournalTableViewCell.height
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard
            let indexPath = tableView.indexPathForSelectedRow,
            let currentCell = tableView.cellForRow(at: indexPath) as? JournalTableViewCell else {
                return
        }

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let editJournalViewController = storyBoard.instantiateViewController(withIdentifier: "EditJournalViewController") as? EditJournalViewController else { return }

        editJournalViewController.receivedJournals = [journals[indexPath.row]]

        self.navigationController?.pushViewController(editJournalViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            journals.remove(at: indexPath.row)
            JournalManager.shared.deleteCoreData(for: indexPath)

            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
}

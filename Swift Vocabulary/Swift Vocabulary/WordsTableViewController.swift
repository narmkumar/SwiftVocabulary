//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Niranjan Kumar on 9/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    var vocabWords = [ VocabularyWord(word: "Variable", definition: "Variables are containers that are used to store information that can be changed"),
                                         VocabularyWord(word: "Constant", definition: "Constants refer to fixed values that a program may not alter during its execution. Constants can be of any of the basic data types like an integer constant, a floating constant, a character constant, or a string literal"),
                                         VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        // Configure the cell...
        // this was another way to do the same thing: (both lines)
        //let word = vocabWords[indexPath.row]
        // cell.textLabel?.text = word.word
        
        cell.textLabel?.text = vocabWords[indexPath.row].word
       

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
        let definitionVC = segue.destination as? DefinitionViewController
        else {
            return
        }
        
        definitionVC.vocabWord = vocabWords[indexPath.row]
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
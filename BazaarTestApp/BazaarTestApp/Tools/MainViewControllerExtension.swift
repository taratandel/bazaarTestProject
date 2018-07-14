//
//  MainViewControllerExtension.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/23/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseManager.getSearches().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchItemCell", for: indexPath)
        let searchItem = databaseManager.getSearches()
        cell.textLabel?.text = searchItem[indexPath.row].title
        return cell
    }
}
extension MainViewController : UITextFieldDelegate{
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        hideKeyboardWhenTappedAround()
        movieName.delegate = self
        movieName.returnKeyType = .search
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        self.searchMovie()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if movieName.isEditing{
            self.suggestionView.isHidden = false
            self.seggestionTableView.reloadData()
        }
        
    }
    
}

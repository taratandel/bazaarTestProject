//
//  DatabaseManager.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/20/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit
import SQLite

/**
 This class handles all of the database actions
 ##Actions##
 1. create table
 2. fetch table
 3. update table
 */
class DatabaseRepository: NSObject {
    
    /** This function create a *table* to put the data in to the *database*
     ##Table Consists of 2 columns##
     1. The *ID* which is the **Primary Key**
     2. The *TITLE* which holds the 10 last queries
     
 */
    func createTables() {
        let search = Table(Search.TABLE_NAME)
        do {
            try DatabaseHelper.sharedDatabase.database.run(search.create {t in
                t.column(Search.ID, primaryKey: .autoincrement)
                t.column(Search.TITLE)

            })
        } catch  {
            print("Database Save Failed")
        }
        
    }
    
    /// This function gives back an *array of **Search** model*
    func getSearches() -> [Search] {
        let search = Table(Search.TABLE_NAME)
        var lstSearches = [Search]()
        let query = search.filter(Search.ID > 0)
        let result = try! DatabaseHelper.sharedDatabase.database.prepare(query)
        lstSearches.append(contentsOf: Search.buildDatabaseList(list: result))
        return lstSearches
    }
    
    /// This function *add* entries in to the table
    func addSearch(searchItem: Search) {
        let search = Table(Search.TABLE_NAME)
        let insert = search.insert(or: .replace, Search.ID <- Int64(searchItem.id), Search.TITLE <- searchItem.title )
        _ = try! DatabaseHelper.sharedDatabase.database.run(insert)
    }
    
    /// This function *edit* the given **Search** item
    func editSearch(searchItem: Search) {
        let search = Table(Search.TABLE_NAME)
        let update = search.update(Search.ID <- Int64(searchItem.id), Search.TITLE <- searchItem.title)
        _ = try! DatabaseHelper.sharedDatabase.database.run(update)
    }
    
    /// This function checks if the number of stored data exceeded from 10
    func searchNumber() -> Int {
        if self.getSearches().count > 10 {
            
        }
    }
    func deleteSearch(SearchItem: Search) {
        let Search = Table(Search.TABLE_NAME)
    }
    
    func deleteAllSearch() {
        let Search = Table(Search.TABLE_NAME)
        _ = try! DatabaseHelper.sharedDatabase.database.run(Search.delete())
    }

    
 
}

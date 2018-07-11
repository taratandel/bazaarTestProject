//
//  File.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/20/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit
import SwiftyJSON
import SQLite
import CoreData

class Movie : NSObject, NSCoding{
    
    static let tableName = "Movie"
    
    var id = 0
    var title = ""
    var posterPatch = ""
    var releaseDate = ""
    var overview = ""
    
    static let ID = Expression<Int64>("id")
    static let TITLE = Expression<String>("title")
    static let POSTER_PATCH = Expression<String>("poster_patch")
    static let RELEASE_DATE = Expression<String>("release_date")
    static let OVERVIEW = Expression<String>("overview")
    
    override init() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeInteger(forKey: "id")
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.posterPatch = aDecoder.decodeObject(forKey: "posterPatch") as! String
        self.releaseDate = aDecoder.decodeObject(forKey: "releaseDate") as! String
        self.overview = aDecoder.decodeObject(forKey: "overview") as! String
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.title, forKey: "id")
        aCoder.encode(self.posterPatch, forKey: "posterPatch")
        aCoder.encode(self.releaseDate, forKey: "releaseDate")
        aCoder.encode(self.overview, forKey: "overview")

    }
    class func buildDataBaseRow(row : Row) -> Movie {
        let movie = Movie()
        movie.id = Int(row[ID])
        movie.title = String(row[TITLE])
        movie.posterPatch = String(row[POSTER_PATCH])
        movie.releaseDate = String(row[RELEASE_DATE])
        movie.overview = String(row[OVERVIEW])
        return movie
    }
    class func buildDatabaseList(list: AnySequence<Row>) -> [Movie] {
        var lstMovie = [Movie]()
        for data in list {
            lstMovie.append(buildDataBaseRow(row: data))
        }
        return lstMovie
    }
    class func buildSingle(data : JSON) -> Movie {
        let movie = Movie()
        movie.id = data["id"].intValue
        movie.overview = data["overview"].stringValue
        movie.posterPatch = data["poster_patch"].stringValue
        movie.releaseDate = data["release_date"].stringValue
        movie.title = data["title"].stringValue
        return movie
        
    }
}

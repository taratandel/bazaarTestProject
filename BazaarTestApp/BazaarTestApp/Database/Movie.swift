//
//  File.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/20/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit
import SwiftyJSON

/// This class holds Movie model which is provided by the API and does the model related functions
class Movie : NSObject, NSCoding{
    
    /// *id* of the *Movie*
    var id = 0
    /// *title* of the *Movie*
    var title = ""
    /// *posterPatch* of the *Movie*
    var posterPatch = ""
    /// *releaseDate* of the *Movie*
    var releaseDate = ""
    /// *overview* of the *Movie*
    var overview = ""
    
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

    /**
     The function takes in a json and gives back a *Movie* model
     */
    class func buildSingle(data : JSON) -> Movie {
        let movie = Movie()
        movie.id = data["id"].intValue
        movie.overview = data["overview"].stringValue
        movie.posterPatch = data["poster_patch"].stringValue
        movie.releaseDate = data["release_date"].stringValue
        movie.title = data["title"].stringValue
        return movie
        
    }
    
    /// this function buld a list of *Movie*
    
    class func buildList(data : JSON) -> [Movie]{
        var movies = [Movie]()
        for index in 0..<data.count{
            movies.append(Movie.buildSingle(data: data[index]))
        }
        return movies
        
    }
}

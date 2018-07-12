//
//  MovieHelper.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/22/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import SwiftyJSON
import UIKit
/// This protocol is for having connection between our helpers and view
/// This protocol benefits from 2 function
/// These functions consider the situation of the given answer
@objc protocol MovieDelegate: NSObjectProtocol{
    @objc optional func getMovieSuccessfuly(lstMoviev: [Movie])
    @objc optional func failedToGetMovie(error : String)
}
/// This class handles the *Movie* related functions
class MovieHelper: NSObject {
    
    var delegate: MovieDelegate!
    func getMovies(page : Int, query : String){
        var lstParams = AppUtils.getAPIKeyParam()
        lstParams["page"] = 1 as AnyObject
        lstParams["query"] = "batman" as AnyObject
        ApiHelper.sharedApi.sendGetRequest(urlString: ValueKeeper.SEARCH_MOVIE, lstParams: lstParams){
            reponse, status in
            print(reponse)
        }
    }
}

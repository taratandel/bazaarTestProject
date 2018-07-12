//
//  APIHelper.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/21/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SWXMLHash
/** This class handle all the requests and their answers
 ##Important Note##
 we use **singleton** pattern in most of our classes including this one to ensure that the highly usable class wont get renewed many times
 */
class ApiHelper: NSObject {
    
    /// **Singleton** pattern impelemented in here
    static let sharedApi: ApiHelper = {
        let instance = ApiHelper()
        
        return instance
    }()
    /// this function send a *get* request using *Alamofire* and parses the answer no matter it is JSON or XML
    func sendGetRequest(urlString: String, lstParams:
        [String: AnyObject], onCompletion: @escaping(JSON, Bool) -> Void) {
        var parameters = AppUtils.getAPIKeyParam()
        for value in lstParams
        {
            parameters[value.key] = value.value
        }
        let url = ValueKeeper.BASE_URL + urlString
        _ = Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData {
            response in
            switch response.result{
            case .success(let value):
                if let jsonRes : JSON = value as? JSON{
                    print("json found")
                    self.checkStatus(json: jsonRes, onCompletion: onCompletion)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    /**
 This function check the status of the answer provided
     - Parameter json: The first part of the full name.
     - Parameter onCompletion: a status which is Boolian and the parsed data whether it is an error or not.
 */
    
    func checkStatus(json: JSON, onCompletion: (JSON, Bool) -> Void) {
        let status = json["results"].string
        if status != nil  {
            onCompletion(json["results"], true)
        } else {
            onCompletion(json["errors"], false)
        }
    }
    
}

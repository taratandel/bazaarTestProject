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
import SwiftyXMLParser
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
        [String: AnyObject], onCompletion: @escaping([String:AnyObject], Bool) -> Void) {

        let url = ValueKeeper.BASE_URL + urlString
        _ = Alamofire.request(url, method: .get, parameters: lstParams, encoding: URLEncoding.default, headers: nil).responseData {
            response in
            switch response.result{
            case .success(let value):
                
                guard let json = try? JSON(data: value) else {
                    break
                }
                if json.type == SwiftyJSON.Type.dictionary {
                    self.checkStatus(json: json, onCompletion: onCompletion)
                }
                
                else if json.type == SwiftyJSON.Type.string {
                    let xml = try! XML.parse(value)
                    self.checkXMLStatus(xml: xml, onCompletion: onCompletion)
                }
                else {
//                    onCompletion
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    /**
     This function check the status of the answer provided
     - Parameter json: Json Data Provided .
     - Parameter onCompletion: a status which is Boolian and the parsed data whether it is an error or not.
     */
    
    func checkStatus(json: JSON, onCompletion: ([String:AnyObject], Bool) -> Void) {
        let status = json["results"].dictionary
        if status != nil  {
            onCompletion(json["results"].dictionary! as [String : AnyObject], true)
        } else if json["errors"] != JSON.null{
            onCompletion(["error":json["errors"].array as AnyObject], false)
        }
    }
    func checkXMLStatus(xml : XML.Accessor, onCompletion: ([String:AnyObject], Bool)-> Void){
        
    }
    
}

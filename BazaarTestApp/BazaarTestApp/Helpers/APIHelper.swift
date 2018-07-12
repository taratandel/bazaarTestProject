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
                
                if let json = try? JSON(data: value)  {
                    if json.type == SwiftyJSON.Type.dictionary {
                        self.checkStatus(json: json, onCompletion: onCompletion)
                    }
    
                }
               
                else {
                     let xml = XML.parse(value)
                        self.checkXMLStatus(xml: xml, onCompletion: onCompletion)
                }
            case .failure(let error):
                onCompletion(["error":error as AnyObject], false)
            }
        }
        
    }
    
    /**
     This function check the status of the answer provided
     - Parameter json: Json Data Provided .
     - Parameter onCompletion: a status which is Boolian and the parsed data whether it is an error or not.
     */
    
    func checkStatus(json: JSON, onCompletion: ([String:AnyObject], Bool) -> Void) {
        let pageCount = json["total_pages"].int
        if pageCount != nil {
            if pageCount! > 0{
            onCompletion(json.dictionary! as [String : AnyObject], true)
            }
            else {
                onCompletion(["error":"query wrong" as AnyObject], false)
            }
        } else if json["errors"] != JSON.null{
            onCompletion(["error":json["errors"].array as AnyObject], false)
        }
        else {
            
        }
    }
    
    /**
     This function checkes the status of the XML response if we have an HTML Tag its and error other wise base on the answer we act
     */
    func checkXMLStatus(xml : XML.Accessor, onCompletion: ([String:AnyObject], Bool)-> Void){
        
        if xml["HTML"].error == nil {
            onCompletion(["error" : "Must use Anti Filter" as AnyObject] ,false)
        }
        else {
            // base on the answer of the API we act to decide whether the answer is correct or not
        }
        
        
    }
    
    
}

//
//  ViewController.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/17/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var search: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var lstParams = [String : AnyObject]()
        lstParams["page"] = 1 as AnyObject
        lstParams["query"] = "batman" as AnyObject
        ApiHelper.sharedApi.sendGetRequest(urlString: ValueKeeper.SEARCH_MOVIE, lstParams: lstParams){
            reponse, status in
            print(reponse)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


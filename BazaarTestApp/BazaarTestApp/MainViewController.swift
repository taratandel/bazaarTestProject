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
    
    let movieHelper = MovieHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func searchMovie(){
        if let query = movieName.text {
            movieHelper.getMovies(page: 1, query: query)
        }
    }
    
    
    /// Initialize The view 
    func initView(){
        self.search.addTarget(self, action: #selector(self.searchMovie), for: .touchUpInside)
    }

}


//
//  ViewController.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/17/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MainViewController: UIViewController, MovieDelegate {

    @IBOutlet weak var movieName: UITextField!
    
    @IBOutlet weak var search: UIButton!
    
    @IBOutlet weak var activityIndic: NVActivityIndicatorView!
    
    var page = 0
    var movies = [Movie]()
    var searchItem = Search()
    
    let movieHelper = MovieHelper()
    var databaseHelper = DatabaseHelper()

    
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
            searchItem.title = self.movieName.text!
            activityIndic.isHidden = false
            activityIndic.startAnimating()
            movieHelper.getMovies(page: 1, query: query)
        }
        else {
            ViewHelper.showToastMessage(message: "لطفا نام فیلم مورد نظر خود را وارد کنید")
        }
    }
    
    
    /// Initialize The view 
    func initView(){
        activityIndic.isHidden = true
        self.search.addTarget(self, action: #selector(self.searchMovie), for: .touchUpInside)
    }
    
    func getMovieSuccessfuly(lstMoviev: [Movie], pageNumber: Int) {
        activityIndic.stopAnimating()
        self.page = pageNumber
        self.movies = lstMoviev
        
        
        performSegue(withIdentifier: "toTableViewSegue", sender: self)

    }
    
    func failedToGetMovie(error: String) {
        ViewHelper.showToastMessage(message: error + "\n" + "try again")
        activityIndic.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "performSegue"{
            let destVC = segue.destination as! MovieDetailTableViewController
            destVC.page = self.page
            destVC.movie = self.movies
            
        }
    }

}


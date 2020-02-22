//
//  MovieGridViewController.swift
//  flixster
//
//  Created by RAUL RIVERO RUBIO on 2/21/20.
//  Copyright © 2020 codepath-cit238b-spring2020. All rights reserved.
//

import UIKit

class MovieGridViewController: UIViewController {
    var movies = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // find all the key named "results"
                // cast to an array of dictionaries (associative arrays, hash tables)
                // Key (String) : Value (Any)
                self.movies = dataDictionary["results"] as! [[String : Any]]
                
                // At this point "self.movies" has been fetch so reload all the function and re executing them
                // -- self.collectionView.reloadData()
                
                print(self.movies)
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

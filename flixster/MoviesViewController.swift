//
//  MoviesViewController.swift
//  flixster
//
//  Created by RAUL RIVERO RUBIO on 2/18/20.
//  Copyright © 2020 codepath-cit238b-spring2020. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var movies = [[String: Any]]()

    // UI Element table view
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
                self.tableView.reloadData()
                
                print(dataDictionary);
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
        
    }
    
    // This function set the amount movies (rows) in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // This function configure each cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // deque resuable cell use recly cell that are off the screen or if the not one a no offscreen varaible available it will create a new one.
        // Performace!
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = self.movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        // API image base url for (jpg)
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        // add the movie poster to the path
        let posterPath = movie["poster_path"] as! String
        // combine the api baseUrl with movies json posterPath
        let posterUrl = URL(string : baseUrl + posterPath)
        
        cell.titleLabel!.text = title
        cell.synopsisLabel!.text = synopsis
        // af_setImage is PODS library from (AlamofireImage)
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
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

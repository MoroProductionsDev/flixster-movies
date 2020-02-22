//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by RAUL RIVERO RUBIO on 2/21/20.
//  Copyright © 2020 codepath-cit238b-spring2020. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie : [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // API image base url for (jpg)
        var baseUrl = "https://image.tmdb.org/t/p/w185"
        // add the movie poster to the path
        let posterPath = movie["poster_path"] as! String
        // combine the api baseUrl with movies json posterPath
        let posterUrl = URL(string : baseUrl + posterPath)
        
        // for the backdrop
        baseUrl = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        // combine the api baseUrl with movies json posterPath
        let backdropUrl = URL(string : baseUrl + backdropPath)
   
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        posterView.af_setImage(withURL: posterUrl!)
        backdropView.af_setImage(withURL: backdropUrl!)
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

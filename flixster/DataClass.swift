//
//  DataClass.swift
//  flixster
//
//  Created by RAUL RIVERO RUBIO on 2/21/20.
//  Copyright © 2020 codepath-cit238b-spring2020. All rights reserved.
//

import Foundation
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!

public posterURL() {
    // API image base url for (jpg)
    let baseUrl = "https://image.tmdb.org/t/p/w185"
    // add the movie poster to the path
    let posterPath = movie["poster_path"] as! String
    // combine the api baseUrl with movies json posterPath
    let posterUrl = URL(string : baseUrl + posterPath)
}

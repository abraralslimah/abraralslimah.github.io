//
//  Movie.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/5/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import UIKit

class Movie {
    var filmID:Int = 0;
    var filmName:String = "";
    var filmDesc:String = "";
    var vote_average:Float = 0.0;
    var poster_path:String = "";
    var genre_ids:[Int] = [];
    
    
    init(filmID:Int, filmName:String , filmDesc:String, vote_average:Float, poster_path:String, genre_ids:[Int] ) {
        self.filmID = filmID;
        self.filmName = filmName;
        self.filmDesc = filmDesc;
        self.vote_average = vote_average;
        self.poster_path = poster_path;
        self.genre_ids = genre_ids;
        
    }
    
    func getMovieGenres() -> String {
        var genresTxt:String = "";
        for gen in genre_ids{
            if let gtxt = GENRES_IDS[gen] {
                genresTxt = "\(genresTxt), \(gtxt)"
            }
        }
        return genresTxt;
    }
    
}





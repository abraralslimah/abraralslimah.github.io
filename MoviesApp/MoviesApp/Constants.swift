//
//  Constants.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/6/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import Foundation
import UIKit

let colors: [String: UIColor] = [
    "primaryColor": UIColor(red:0.95, green:0.61, blue:0.07, alpha:1.0),
    "lightColor": UIColor(red:1, green:1, blue:1, alpha:0.84),
    "grayColor": UIColor(red:1, green:1, blue:1, alpha:0.60),
    "dangerColor": UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0),
    "lowRatingBackgroundColor": UIColor(red:0.15, green:0.68, blue:0.38, alpha:1.0),
    "highRatingBackgroundColor": UIColor(red:0.95, green:0.77, blue:0.06, alpha:1.0),
    "primaryBackgroundColor": UIColor(red:0.11, green:0.12, blue:0.09, alpha:1.0),
    "highlightBackgroundColor": UIColor(red:0.15, green:0.16, blue:0.13, alpha:1.0),
    "borderColor": UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
]






let APIKEY = "e99dbb350114600dabf09374ec4c7741"
let APIURLPrefix = "https://api.themoviedb.org/3"
let imageURLPrefix = "https://image.tmdb.org/t/p/w300"

var GENRES_IDS:[Int:String] = [:]

var bookmarked:[Int] =  []




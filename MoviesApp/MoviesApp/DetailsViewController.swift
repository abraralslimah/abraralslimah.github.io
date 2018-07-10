//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/9/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectedMovie:Movie? ;
    
    @IBOutlet weak var bu_unbook: UIBarButtonItem!
    @IBOutlet weak var bu_book: UIBarButtonItem!
    @IBOutlet weak var moveiGenres: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var xapp = false;
        for item in bookmarked{
            if item == (selectedMovie?.filmID)!{
                xapp = true;
            }
        }
        if(xapp){
            bu_book.title = "";
            bu_unbook.title = "Remove Bookmark";
        }else{
            bu_book.title = "Bookmark";
            bu_unbook.title = "";
        }
        
        
        movieName.text = selectedMovie?.filmName;
        movieDesc.text = selectedMovie?.filmDesc;
        moveiGenres.text = selectedMovie?.getMovieGenres();
        let imageUrl:URL = URL(string: "\(imageURLPrefix)\(selectedMovie?.poster_path ?? "NoURL")")!
        
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        movieImage.image = UIImage(data: imageData as Data) ;
    }

    @IBAction func removeBookmark(_ sender: Any) {
        bu_unbook.title = "";
        bu_book.title = "Bookmark";
        
        for n in 0...bookmarked.count - 1 {
            if bookmarked[n] == (selectedMovie?.filmID)! {
                bookmarked.remove(at: n)
                return
            }
        }
        
    }
    
    @IBAction func addBookmark(_ sender: Any) {
        bookmarked.append((selectedMovie?.filmID)!)
        bu_book.title = "";
        bu_unbook.title = "Remove Bookmark";
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

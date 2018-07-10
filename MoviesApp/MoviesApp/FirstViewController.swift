//
//  FirstViewController.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/5/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UITextFieldDelegate{

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bu_favorites: UIBarButtonItem!
    
    @IBOutlet weak var bu_all: UIBarButtonItem!
    var moviesList = Array<Movie>()
    var favoList = Array<Movie>()
    var selectedMovie:Movie? = nil;
    let url="\(APIURLPrefix)/discover/movie?api_key=\(APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false";
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch.delegate = self;
        bu_all.title = ""
        // Do any additional setup after loading the view, typically from a nib.
            //GetAllGenres()
           LoadURL(url: url)
        
       
        
    }
    
    @IBAction func all_clicked(_ sender: Any) {
        moviesList.removeAll()
        bu_favorites.title = "Favorites"
        bu_all.title = ""
        let url="\(APIURLPrefix)/discover/movie?api_key=\(APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false";
        LoadURL(url: url)
        
    }
    @IBAction func favo_clicked(_ sender: Any) {
        bu_favorites.title = ""
        bu_all.title = "All"
        favoList.removeAll()
        for movie in moviesList{
            if bookmarked.contains(movie.filmID) {
               favoList.append(movie)
            }
        }
        moviesList.removeAll()
        moviesList = favoList
         self.tableView.reloadData();
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearch.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        moviesList.removeAll()
        var surl = ""
        if txtSearch.text == nil {
             surl="\(APIURLPrefix)/discover/movie?api_key=\(APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false";
        }else{
        
         surl="\(APIURLPrefix)/search/multi?api_key=\(APIKEY)&language=en-US&query=\(txtSearch.text!)&include_adult=false";
        
        }
        
        LoadURL(url: surl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! MoviesTableViewCell;
        
        //cell.textLabel?.text = moviesList[indexPath.row].filmName;
        cell.filmName.text = moviesList[indexPath.row].filmName;
        cell.filmRate.text = String(moviesList[indexPath.row].vote_average);
        let imageUrl:URL = URL(string: "\(imageURLPrefix)\(moviesList[indexPath.row].poster_path)")!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        cell.img.image = UIImage(data: imageData as Data) ;
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: moviesList[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recVC = segue.destination as! DetailsViewController
        if let selMovie = sender as? Movie {
            recVC.selectedMovie = selMovie
        }
        
    }
    
    func LoadURL(url:String){
        
        moviesList.removeAll()
        
        //paralel process
        //DispatchQueue.global().async {
            
            do{
                // load json server
                let AppURL=URL(string: url)!
                let data=try Data(contentsOf: AppURL)
                let json=try JSONSerialization.jsonObject(with: data ) as! [String:Any]
                let results=json["results"] as?  [[String:Any]]
                
                for result in results! {
                    if (result["id"] == nil || result["title"] == nil || result["overview"] == nil || result["vote_average"] == nil || result["poster_path"] == nil || result["genre_ids"] == nil ){
                        // do nothing
                    } else {
                    
                    self.moviesList.append(Movie(filmID: result["id"]! as! Int, filmName: result["title"]! as! String,
                                                 filmDesc: result["overview"]! as! String,
                                                 vote_average: result["vote_average"]! as! Float,
                                                 poster_path: result["poster_path"]! as! String, genre_ids: result["genre_ids"]! as! [Int]));
                    }}
               
                //DispatchQueue.global().sync {
                    self.tableView.reloadData();
                //}
                
            }
            catch {
                print("Connection Error!")
                let alert = UIAlertController(title: "Error", message: "No Internet Connection", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        self.LoadURL(url: self.url)
                        
                    case .cancel: break
                        
                    case .destructive:
                        break;
                    }}))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    //}
    

    func GetAllGenres(){
        do{
        let genUrl = "\(APIURLPrefix)/genre/movie/list?api_key=\(APIKEY)&language=en-US";
        let AppURL=URL(string: genUrl)!
        let data=try Data(contentsOf: AppURL)
        let json=try JSONSerialization.jsonObject(with: data ) as! [String:Any]
            //GENRES_IDS = (json["genres"] as?  [[Int:String]])!
            let results=json["genres"] as?  [Int:String]
            //GENRES_IDS = results!;
            print(results)
        }catch{
            
        }
        }
    
    
    
}


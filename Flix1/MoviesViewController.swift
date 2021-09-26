//
//  MoviesViewController.swift
//  Flix1
//
//  Created by Maria  Condemaita on 9/19/21.
//

import UIKit
import AlamofireImage  //https://github.com/Alamofire/AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for movie in movies {
            //movie.print("movies\(movie)")
        //}
        
        TableView.rowHeight = 150
        TableView.dataSource = self
        TableView.delegate = self

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
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.TableView.reloadData()
                
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell // to reuse the data
    
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        
        cell.movietitle.text = title
        cell.movieoverview.text = overview
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let imagepath = movie["poster_path"] as! String
        let imageurl = URL(string: baseUrl + imagepath)
        
        cell.postcell.af.setImage(withURL: imageurl!) // ? options or ! just add it 
        
        return cell
        
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation - seding data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("Loading up the details screen")
        // Find the selected movies how do we know which movie was selected
        let cell = sender as! UITableViewCell // sender is sellecting the cell 
        let indexPath = TableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]

        // Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! // segue know where to go
        MovieDetailsViewController
        
        detailsViewController.movie = movie // the 2nd movie is our movie we just find
        
        TableView.deselectRow(at: indexPath, animated:true)
    }

}

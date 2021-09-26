//
//  MovieDetailsViewController.swift
//  Flix1
//
//  Created by Maria  Condemaita on 9/24/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieoverview: UILabel! // intead of synopsisLabel
    
    var movie: [String:Any]! //swift optionals
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        movieoverview.text = movie["overview"] as? String
        movieoverview.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let imagepath = movie["poster_path"] as! String
        let imageurl = URL(string: baseUrl + imagepath)
        
        posterView.af.setImage(withURL: imageurl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af.setImage(withURL: imageurl!)
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

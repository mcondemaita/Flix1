//
//  MovieCell.swift
//  Flix1
//
//  Created by Maria  Condemaita on 9/20/21.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var movietitle: UILabel!
    @IBOutlet weak var movieoverview: UILabel!
    @IBOutlet weak var postcell: UIImageView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

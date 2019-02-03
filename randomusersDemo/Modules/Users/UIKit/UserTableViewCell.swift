//
//  UserTableViewCell.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var name: UILabel!
    
    static var cellIdentifier: String {
        return "UserTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        picture.layer.masksToBounds = true
        picture.layer.cornerRadius = picture.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(user: User?) {
        guard let u = user else { return }
        if let url = URL.init(string: u.picture.thumbnail) {
            picture.sd_setImage(with: url, completed: nil)            
        }
        name.text = String.init(format: "%@. %@ %@", u.name.title, u.name.first, u.name.last)
    }
}

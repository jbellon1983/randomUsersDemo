//
//  UserProfileView.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SDWebImage

class UserProfileView : UIViewController {
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var name: UILabel!
    
    let disposeBag = DisposeBag()
    
    var viewModel: UserProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.user.asObservable().subscribe({ (user) in
            guard let u = user.element,
                  let url = URL.init(string: u.picture?.large ?? ""),
                  let name = u.name
            else { return }
            
            self.setProfilePicture(url: url)
            self.name.text = String.init(format: "%@. %@ %@", name.title, name.first, name.last).uppercased()
            
        }).disposed(by: disposeBag)
    }
    
    private func setProfilePicture(url: URL?) {
        picture.layer.masksToBounds = true
        picture.layer.cornerRadius = picture.frame.size.height/2
        picture.sd_setImage(with: url, completed: nil)
    }
}

extension UserProfileView {
    static func view(viewModel: UserProfileViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserProfileView") as? UserProfileView else {
            fatalError("Cannot instantiate UsersView")
        }
        view.viewModel = viewModel
        return view
    }
}


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
        viewModel?.user.asObservable().subscribe(onNext: { (user) in
            guard
                let u = user,
                let url = URL.init(string: u.picture?.large ?? ""),
                let name = u.name
                else { return }
            
            self.setProfilePicture(url: url)
            self.name.text = String.init(format: "%@. %@ %@", name.title, name.first, name.last).uppercased()
            self.configureNavigationBar()
        }, onError: { (_) in
            
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    private func configureNavigationBar() {        
        guard let user = try? viewModel?.user.value(), let isFav = user?.isFav else { return }
        if isFav {
            let favButton = UIBarButtonItem.init(image: UIImage(named: "favourite_icon_on"), style: .done, target: self, action: #selector(tapFav))
            self.navigationItem.rightBarButtonItems = [favButton]
        } else {
            let favButton = UIBarButtonItem.init(image: UIImage(named: "favourite_icon_off"), style: .done, target: self, action: #selector(tapFav))
            self.navigationItem.rightBarButtonItems = [favButton]
        }

    }
    
    private func setProfilePicture(url: URL?) {
        picture.layer.masksToBounds = true
        picture.layer.cornerRadius = picture.frame.size.height/2
        picture.sd_setImage(with: url, completed: nil)
    }
    
    @objc private func tapFav() {
        viewModel?.saveFavourite()
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


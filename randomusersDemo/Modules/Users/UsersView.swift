//
//  UsersView.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class UsersView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    var viewModel: UsersViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultStyle(.dark)
        configureSearchController()
        configureTableView()
        configureSubscribers()
        
        loadData()
    }
    
    func configureTableView() {
        tableView.register(UINib.init(nibName: UserTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureSubscribers() {
        viewModel?.users.asObservable().subscribe({ (_) in
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }).disposed(by: disposeBag)
    }
    
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = ""
        searchBar.placeholder = "search a user by name, surname or email"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func loadData() {
        SVProgressHUD.show()
        viewModel?.loadMoreUsers(first: true)
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.users.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier, for: indexPath) as! UserTableViewCell
        
        guard let users = viewModel?.users.value else { return cell }        
        cell.loadData(user: users[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let users = viewModel?.users.value else { return }
        if indexPath.row == users.count-1 {
            SVProgressHUD.show()
            viewModel?.loadMoreUsers(first: true)
        }
    }
}

extension UsersView {
    static func view(viewModel: UsersViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UsersView") as? UsersView else {
            fatalError("Cannot instantiate UsersView")
        }
        view.viewModel = viewModel
        return view
    }
}

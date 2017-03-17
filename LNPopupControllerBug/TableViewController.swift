//
//  TableViewController.swift
//  LNPopupControllerBug
//
//  Created by Kurt Jensen on 3/16/17.
//  Copyright © 2017 Arbor Apps. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        return tableView
    }()
    
    fileprivate var isFetching = false {
        didSet {
            // this causes the chevron to appear above the navbar
            navigationItem.setLeftBarButton(isFetching ? fetchActivityButtonItem : nil, animated: false)
            if isFetching {
                navigationController?.popupItem.progress = 0
            } else {
                navigationController?.popupItem.progress = 1
            }
        }
    }
    
    lazy var fetchActivityButtonItem: UIBarButtonItem = {
        let barButtonItem =  UIBarButtonItem()
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicatorView.hidesWhenStopped = false
        activityIndicatorView.startAnimating()
        barButtonItem.customView = activityIndicatorView
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        isFetching = true
    }
    
    internal func setupTableView() {
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0)
        tableView.rowHeight = 44
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

//
//  FavourituesViewController.swift
//  Club Info
//
//  Created by ammar on 31/05/2023.
//

import UIKit

class FavourituesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel : FavourtiesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel =  FavourtiesViewModel(database: DatabaseManager.getInstans())
        
        // Do any additional setup after loading the view.
    }
    

    

    

}

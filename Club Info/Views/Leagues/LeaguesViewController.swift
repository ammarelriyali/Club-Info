//
//  LeaguesViewController.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import UIKit

class LeaguesViewController: UITableViewController {
    var type :HomeType!
    override func viewDidLoad() {
        super.viewDidLoad()
        let modelView=LeaguesViewModel(service: Service.getInstans())
        switch(type!){
            
        case HomeType.Football:
            modelView.getFootball()
            break
        case .BasketBall:
            break
        case .Cricket:
            break
        case .Tennis:
            break
        }
        
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

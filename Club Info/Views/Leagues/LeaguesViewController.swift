//
//  LeaguesViewController.swift
//  Club Info
//
//  Created by ammar on 23/05/2023.
//

import UIKit

class LeaguesViewController: UITableViewController {
    var type :HomeType!
    var arr:[League]?
    var modelView : LeaguesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        modelView=LeaguesViewModel(service: Service.getInstans()){ [weak self] data in
            if let res = data{
                self?.arr=res.result
            }
            else{
                self?.showSimpleAlert()
            }
            self?.tableView.reloadData()
        }
        
        
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
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Connnection faild ", message: "pleas check your connction",         preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in

        }))

          self.present(alert, animated: true, completion: nil)
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

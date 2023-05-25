//
//  Views.swift
//  Club Info
//
//  Created by ammar on 24/05/2023.
//

import Foundation
import UIKit

func showConnectionAlert(_ view: UIViewController?) {
    let alert = UIAlertController(title: "Connnection faild ", message: "pleas check your connction",         preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in

    }))

      view?.present(alert, animated: true, completion: nil)
  }

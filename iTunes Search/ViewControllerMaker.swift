//
//  ViewControllerMaker.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

class ViewControllerMaker {}

extension ViewControllerMaker {
  static func searchViewController() -> SearchViewController {
    let manager = SearchManager()
    return SearchViewController(manager: manager)
  }
}

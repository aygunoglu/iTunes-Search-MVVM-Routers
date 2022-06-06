//
//  SearchRouter.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

protocol SearchRouterProtocol {
  var pushViewController: ((_ viewController: UIViewController) -> Void)? { get set }
  var popViewController: VoidHandler? { get set }
  var popToViewController: VoidHandler? { get set }
  
  func goToDetailVC(cellViewModel: SearchResultCellViewModelProtocol)
}

class SearchRouter: SearchRouterProtocol {  
  var pushViewController: ((_ viewController: UIViewController) -> Void)?
  var popViewController: VoidHandler?
  var popToViewController: VoidHandler?
  
  func goToDetailVC(cellViewModel: SearchResultCellViewModelProtocol) {
    let detailVC = ViewControllerMaker.searchDetailViewController(cellViewModel: cellViewModel)
    pushViewController?(detailVC)
  }
}

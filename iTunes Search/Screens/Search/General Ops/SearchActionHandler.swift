//
//  SearchActionHandler.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

protocol SearchActionHandlerProtocol {
  func loadNextPage()
  func goToDetailVC(cellViewModel: SearchResultCellViewModelProtocol)
}

class SearchActionHandler: SearchActionHandlerProtocol {
  var pageProvider: SearchPageProviderProtocol
  var router: SearchRouterProtocol
  var viewModel: SearchViewModelProtocol
  
  init(pageProvider: SearchPageProviderProtocol, router: SearchRouterProtocol, viewModel: SearchViewModelProtocol) {
    self.pageProvider = pageProvider
    self.router = router
    self.viewModel = viewModel
  }
  
  func loadNextPage() {
    pageProvider.requestPage(for: .next)
  }
  
  func goToDetailVC(cellViewModel: SearchResultCellViewModelProtocol) {
    self.router.goToDetailVC(cellViewModel: cellViewModel)
  }
}

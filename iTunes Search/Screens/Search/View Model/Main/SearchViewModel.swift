//
//  SearchViewModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

protocol SearchViewModelProtocol {
  var cellViewModels: [SearchCellBaseViewModelProtocol] { get set }
  var searchFilters: [String: Any] { get set }
  var dataUpdated: VoidHandler? { get set }
  var showEmptyState: VoidHandler? { get set }
}

class SearchViewModel: SearchViewModelProtocol {
  var cellViewModels: [SearchCellBaseViewModelProtocol]
  var searchFilters: [String : Any]
  var dataUpdated: VoidHandler?
  var showEmptyState: VoidHandler?
  
  init() {
    cellViewModels = []
    searchFilters = [:]
  }
}

//
//  SearchViewModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

protocol SearchViewModelProtocol {
  var cellViewModels: [SearchCellBaseViewModelProtocol] { get set }
  var selectedFilters: [String: Any] { get set }
  var dataUpdated: VoidHandler? { get set }
}

class SearchViewModel: SearchViewModelProtocol {
  var cellViewModels: [SearchCellBaseViewModelProtocol]
  var selectedFilters: [String : Any]
  var dataUpdated: VoidHandler?
  
  init() {
    cellViewModels = []
    selectedFilters = [:]
  }
  
  
}

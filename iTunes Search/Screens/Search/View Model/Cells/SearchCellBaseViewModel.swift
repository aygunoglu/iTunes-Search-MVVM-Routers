//
//  SearchCellBaseViewModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

protocol SearchCellBaseViewModelProtocol {
  var cellType: SearchCellType { get }
}

class SearchCellBaseViewModel: SearchCellBaseViewModelProtocol {
  var cellType: SearchCellType = .resultsCell
}

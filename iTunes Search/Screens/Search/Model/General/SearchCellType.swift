//
//  SearchCellType.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

enum SearchCellType: CaseIterable {
  case resultsCell
  case placeholderCell
  
  var identifier: String {
    switch self {
    case .resultsCell:
      return Constants.searchResultsCellIdentifier
    case .placeholderCell:
      return Constants.searchPlaceholderCellIdentifier
    }
  }
}

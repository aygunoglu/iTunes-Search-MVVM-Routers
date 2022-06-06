//
//  SearchDetailCellType.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 7.06.2022.
//

import Foundation

enum SearchDetailCellType: String, CaseIterable {
  case imageCell
  case titleCell
  case infoCell
  case descriptionCell
  
  var identifier: String {
    switch self {
    case .imageCell:
      return Constants.detailImageCellIdentifier
    case .titleCell:
      return Constants.detailTitleCellIdentifier
    case .infoCell:
      return Constants.detailInfoCellIdentifier
    case .descriptionCell:
      return Constants.detailDescriptionCellIdentifier
    }
  }
}

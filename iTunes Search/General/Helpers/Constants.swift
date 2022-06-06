//
//  Constants.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

struct Constants {
  static let searchBaseURL = "https://itunes.apple.com/"
  static let searchRegion = "US"
  static let textFilterParamName = "term"
  static let scopeFilterParamName = "media"
  static let requestItemLimit = 20
  
  static let searchVCNavigationTitle = "iTunes Search"
  static let detailVCNavigationTitle = "Details"
  
  static let searchBarPlaceholderText = "Type at least two letters"
  static let emptyStateMessage = "No results."
  
  static let searchResultsCellIdentifier = "SearchResultsCell"
  static let searchPlaceholderCellIdentifier = "SearchPlaceholderCell"
  
  static let detailImageCellIdentifier = "DetailImageCell"
  static let detailTitleCellIdentifier = "DetailTitleCell"
  static let detailInfoCellIdentifier = "DetailInfoCell"
  static let detailDescriptionCellIdentifier = "DetailDescriptionCell"
}

//
//  SearchResultCellViewModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

protocol SearchResultCellViewModelProtocol: SearchCellBaseViewModelProtocol {
  var backgroundColor: UIColor { get }
  var contentKind: String { get }
  var titleText: String { get }
  var releaseText: String { get }
  var priceText: String { get }
  var descriptionText: String? { get }
  var imageURL: String { get }
}

class SearchResultCellViewModel: SearchCellBaseViewModel, SearchResultCellViewModelProtocol {
  var backgroundColor: UIColor = .systemGray4
  var contentKind: String
  var titleText: String
  var releaseText: String
  var priceText: String
  var descriptionText: String?
  var imageURL: String
  
  init(contentKind: String, titleText: String, releaseText: String, priceText: String, descriptionText: String?, imageURL: String) {
    self.contentKind = contentKind
    self.titleText = titleText
    self.releaseText = releaseText
    self.priceText = priceText
    self.descriptionText = descriptionText
    self.imageURL = imageURL
    super.init()
    self.cellType = .resultsCell
  }
}

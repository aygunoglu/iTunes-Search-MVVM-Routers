//
//  SearchResultCellViewModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

protocol SearchResultCellViewModelProtocol: SearchCellBaseViewModelProtocol {
  var backgroundColor: UIColor { get }
  var titleText: String { get }
  var releaseText: String { get }
  var priceText: String { get }
  var imageURL: String { get }
}

class SearchResultCellViewModel: SearchCellBaseViewModel, SearchResultCellViewModelProtocol {
  var backgroundColor: UIColor = .systemGray4
  var titleText: String
  var releaseText: String
  var priceText: String
  var imageURL: String
  
  init(titleText: String, releaseText: String, priceText: String, imageURL: String) {
    self.titleText = titleText
    self.releaseText = releaseText
    self.priceText = priceText
    self.imageURL = imageURL
    super.init()
    self.cellType = .resultsCell
  }
}

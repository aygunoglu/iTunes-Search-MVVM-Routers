//
//  SearchResultsParser.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

protocol SearchResultsParserProtocol {
  func parseDataSource(from responseModel: SearchResponseModel, paginationType: PaginationType) throws -> [SearchCellBaseViewModelProtocol]
}

class SearchResultsParser: SearchResultsParserProtocol {
  func parseDataSource(from responseModel: SearchResponseModel, paginationType: PaginationType) throws -> [SearchCellBaseViewModelProtocol] {
    var parsedViewModels: [SearchCellBaseViewModelProtocol] = []
    try responseModel.results.forEach { resultItem in
      parsedViewModels.append(try createResultCellViewModel(from: resultItem))
    }
    if responseModel.resultCount == 20 {
      parsedViewModels.append(createPlaceholderCellViewModel())
    }
    return parsedViewModels
  }
  
  private func createResultCellViewModel(from resultItem: SearchItem) throws -> SearchCellBaseViewModelProtocol {
    let titleText = resultItem.trackName
    let releaseText = resultItem.releaseDate.getReadableDateFromISO8601(dateStyle: .medium, timeStyle: .none)
    
    let imageURL = resultItem.artworkUrl100
    let largerImageURL = String(imageURL.dropLast(13) + "200x200bb.jpg")
    
    var priceText = ""
    if let trackPrice = resultItem.trackPrice { priceText = "$\(trackPrice)" }
    if let appPrice = resultItem.price { priceText = "$\(appPrice)" }
    if let formattedPrice = resultItem.formattedPrice { priceText = formattedPrice }
    
    return SearchResultCellViewModel(titleText: titleText, releaseText: releaseText, priceText: priceText, imageURL: largerImageURL)
  }
  
  private func createPlaceholderCellViewModel() -> SearchPlaceholderCellViewModelProtocol {
    let placeholderCellViewModel = SearchPlaceholderCellViewModel()
    placeholderCellViewModel.cellType = .placeholderCell
    return placeholderCellViewModel
  }
}

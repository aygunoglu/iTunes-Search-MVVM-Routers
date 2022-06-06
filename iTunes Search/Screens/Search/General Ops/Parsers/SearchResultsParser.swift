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
    let contentKind = resultItem.kind.capitalized
    let titleText = resultItem.trackName
    let releaseText = resultItem.releaseDate.getReadableDateFromISO8601(dateStyle: .medium, timeStyle: .none)
    
    let imageURL = resultItem.artworkUrl100
    let largerImageURL = String(imageURL.dropLast(13) + "600x600bb.jpg")
    
    var priceDouble = 0.23
    if let trackPrice = resultItem.trackPrice { priceDouble = trackPrice }
    if let price = resultItem.price { priceDouble = price }
    let priceText = priceDouble == 0.00 ? "Free" : "$\(priceDouble)"
    
    var longDescription: String?
    if let description  = resultItem.longDescription { longDescription = description }
    if let description = resultItem.description { longDescription = description }
    
    return SearchResultCellViewModel(contentKind: contentKind, titleText: titleText, releaseText: releaseText, priceText: priceText, descriptionText: longDescription, imageURL: largerImageURL)
  }
  
  private func createPlaceholderCellViewModel() -> SearchPlaceholderCellViewModelProtocol {
    let placeholderCellViewModel = SearchPlaceholderCellViewModel()
    placeholderCellViewModel.cellType = .placeholderCell
    return placeholderCellViewModel
  }
}

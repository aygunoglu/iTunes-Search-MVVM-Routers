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
    return parsedViewModels
  }
  
  private func createResultCellViewModel(from resultItem: SearchItem) throws -> SearchCellBaseViewModelProtocol {
    let titleText = resultItem.trackName
    let priceText = resultItem.trackPrice
    let releaseText = resultItem.releaseDate.getReadableDateFromISO8601(dateStyle: .medium, timeStyle: .none)
    
    let imageURL = resultItem.artworkUrl100
    let largerImageURL = String(imageURL.dropLast(13) + "200x200bb.jpg")
    
    return SearchResultCellViewModel(titleText: titleText, releaseText: releaseText, priceText: "$\(priceText)", imageURL: largerImageURL)
  }
}

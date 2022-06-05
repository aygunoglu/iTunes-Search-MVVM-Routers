//
//  SearchPageProvider.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

protocol SearchPageProviderProtocol {
  func requestPage(for paginationType: PaginationType)
}

class SearchPageProvider: SearchPageProviderProtocol {
  let operationQueue = OperationQueue()
  var viewModel: SearchViewModelProtocol
  var parser: SearchResultsParserProtocol
  
  init(viewModel: SearchViewModelProtocol, parser: SearchResultsParserProtocol) {
    self.viewModel = viewModel
    self.parser = parser
  }
  
  func requestPage(for paginationType: PaginationType) {
    operationQueue.name = "Search Results Fethincg Operation"
    operationQueue.qualityOfService = .utility
    
    let searchOperation = BlockOperation {
      self.sendRequest(for: paginationType) { isSuccess in
        if !isSuccess {
          self.operationQueue.cancelAllOperations()
        }
      }
    }
    
    operationQueue.addOperation(searchOperation)
  }
  
  private func sendRequest(for paginationType: PaginationType, _ completion: @escaping CompletionHandler) {
    guard let apiMethod = getAPIMethod() else { return }
    let target = SearchAPI(apiMethod: apiMethod)
    
    SearchAPIProvider.apiProvider.request(target) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.global(qos: .userInitiated).async {
        switch result {
        case .success(let response):
          do {
            let mappedData = try JSONDecoder().decode(SearchResponseModel.self, from: response.data)
            self.handleResult(for: paginationType, mappedData) { isSuccess in
              completion(isSuccess)
            }
          } catch let error {
            print(error)
            completion(false)
          }
        case .failure(let error):
          print(error)
          completion(false)
        }
      }
    }
  }
  
  private func handleResult(for paginationType: PaginationType, _ responseModel: SearchResponseModel, _ completion: CompletionHandler) {
    switch paginationType {
    case .initial:
      do {
        viewModel.cellViewModels = try parser.parseDataSource(from: responseModel, paginationType: .initial)
        viewModel.dataUpdated?()
      } catch {
        completion(false)
      }
    case .next:
      print("next page requested")
    }
  }
  
  private func getAPIMethod() -> SearchAPIMethod? {
    return SearchAPIMethod.getSearchResults(searchFilters: viewModel.searchFilters)
  }
}

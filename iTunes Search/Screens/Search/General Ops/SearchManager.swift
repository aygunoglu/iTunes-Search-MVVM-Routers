//
//  SearchManager.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

protocol SearchManagerProtocol {
  var viewModel: SearchViewModelProtocol { get set }
  var resultsParser: SearchResultsParserProtocol { get set }
  var dataSource: SearchDataSource { get set }
  var router: SearchRouterProtocol { get set }
  var pageProvider: SearchPageProviderProtocol { get set }
}

class SearchManager: SearchManagerProtocol {
  lazy var viewModel: SearchViewModelProtocol = {
    return SearchViewModel()
  }()
  
  lazy var resultsParser: SearchResultsParserProtocol = {
    return SearchResultsParser()
  }()
  
  lazy var dataSource: SearchDataSource = {
    return SearchDataSource(viewModel: viewModel)
  }()
  
  lazy var router: SearchRouterProtocol = {
    return SearchRouter()
  }()
  
  lazy var pageProvider: SearchPageProviderProtocol = {
    return SearchPageProvider(viewModel: viewModel, parser: resultsParser)
  }()
}

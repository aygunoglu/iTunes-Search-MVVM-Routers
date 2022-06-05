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
  var actionHandler: SearchActionHandlerProtocol { get set }
}

class SearchManager: SearchManagerProtocol {
  lazy var viewModel: SearchViewModelProtocol = {
    return SearchViewModel()
  }()
  
  lazy var resultsParser: SearchResultsParserProtocol = {
    return SearchResultsParser()
  }()
  
  lazy var dataSource: SearchDataSource = {
    return SearchDataSource(viewModel: viewModel, actionHandler: actionHandler)
  }()
  
  lazy var router: SearchRouterProtocol = {
    return SearchRouter()
  }()
  
  lazy var pageProvider: SearchPageProviderProtocol = {
    return SearchPageProvider(viewModel: viewModel, parser: resultsParser)
  }()
  
  lazy var actionHandler: SearchActionHandlerProtocol = {
    return SearchActionHandler(pageProvider: pageProvider, router: router, viewModel: viewModel)
  }()
}

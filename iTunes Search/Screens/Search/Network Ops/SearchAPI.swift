//
//  SearchAPI.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation
import Moya

enum SearchAPIMethod {
  case getSearchResults
}

struct SearchAPI {
  var id = UUID()
  let apiMethod: SearchAPIMethod
}

extension SearchAPI: TargetType {
  var baseURL: URL {
    return URL(string: Constants.searchBaseURL)!
  }
  
  var method: Moya.Method {
    switch apiMethod {
    case .getSearchResults:
      return .get
    }
  }
  
  var path: String {
    switch apiMethod {
    case .getSearchResults:
      return "search"
    }
  }
  
  var task: Task {
    var params: [String: Any] = [:]
    
    params[Keys.searchRegion.rawValue] = Constants.searchRegion
    params[Keys.itemLimit.rawValue] = Constants.requestItemLimit
    
    switch apiMethod {
    case .getSearchResults:
      params[Keys.searchTerms.rawValue] = "leonardo dicaprio"
      params["media"] = "movie"
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type" : "application/json"]
  }
}

extension SearchAPI {
  private enum Keys: String {
    case searchRegion = "country"
    case searchTerms = "term"
    case itemLimit = "limit"
    
  }
}


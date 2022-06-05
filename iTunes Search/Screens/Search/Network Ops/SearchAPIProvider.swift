//
//  SearchAPIProvider.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation
import Moya

struct SearchAPIProvider {
  static let apiProvider = MoyaProvider<SearchAPI>()
}

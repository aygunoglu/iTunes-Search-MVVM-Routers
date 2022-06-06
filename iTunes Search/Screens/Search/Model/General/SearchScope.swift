//
//  SearchScope.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

enum SearchScope: String, CaseIterable {
  case movies = "movie"
  case books = "ebook"
  case podcast = "podcast"
  case music = "music"
  
  var displayName: String {
    switch self {
    case .movies:
      return "Movies"
    case .books:
      return "Books"
    case .podcast:
      return "Podcasts"
    case .music:
      return "Music"
    }
  }
}

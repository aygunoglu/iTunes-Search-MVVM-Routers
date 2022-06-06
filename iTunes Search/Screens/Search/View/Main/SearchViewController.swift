//
//  SearchViewController.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

class SearchViewController: UIViewController {
  
  var manager: SearchManagerProtocol
  let searchController = UISearchController()
  
  let collectionView: UICollectionView = {
    let viewLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    collectionView.alwaysBounceVertical = true
    return collectionView
  }()
  
  init(manager: SearchManagerProtocol) {
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGeneralView()
    setupSearchController()
    setupCollectionView()
    setupBindings()
  }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 30) / 2
    return CGSize(width: width, height: 296)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let cell = cell as? SearchBaseCollectionViewCell
    cell?.willDisplay()
  }
}

extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    if text.count > 1 {
      manager.viewModel.searchFilters[Constants.textFilterParamName] = text
      manager.viewModel.searchFilters[Constants.scopeFilterParamName] = getSelectedScope()
      manager.pageProvider.requestPage(for: .initial)
    }
  }
  
  private func getSelectedScope() -> String {
    switch searchController.searchBar.selectedScopeButtonIndex {
    case 0:
      return SearchScope.movies.rawValue
    case 1:
      return SearchScope.books.rawValue
    case 2:
      return SearchScope.podcast.rawValue
    case 3:
      return SearchScope.music.rawValue
    default:
      return "all"
    }
  }
}


//
//  SearchViewController+Setup.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

extension SearchViewController {
  final func setupView() {
    view.backgroundColor = .systemPink
    navigationItem.title = Constants.searchVCNavigationTitle
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  final func setupSearchController() {
    navigationItem.searchController = searchController
    searchController.searchResultsUpdater = self
    searchController.searchBar.placeholder = Constants.searchBarPlaceholderText
    searchController.searchBar.scopeButtonTitles = SearchScope.allCases.map { $0.displayName }
  }
  
  final func setupCollectionView() {
    view.addSubview(self.collectionView)
    self.collectionView.backgroundColor = .systemBackground
    self.collectionView.delegate = self
    self.collectionView.dataSource = self.manager.dataSource
    
    self.collectionView.register(UINib(nibName: "SearchResultsCell", bundle: nil), forCellWithReuseIdentifier: "SearchResultsCell")
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([self.collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                 self.collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 self.collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 self.collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
  }
  
  final func setupBindings() {
    self.manager.viewModel.dataUpdated = dataUpdated()
  }
}

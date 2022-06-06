//
//  SearchViewController+Bindings.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

extension SearchViewController {
  final func dataUpdated() -> VoidHandler {
    return { [weak self] in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.collectionView.backgroundView = nil
        self.collectionView.reloadData()
      }
    }
  }
  
  final func showEmptyState() -> VoidHandler {
    return { [weak self] in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.collectionView.setEmptyMessage("No results.")
        self.collectionView.reloadData()
      }
    }
  }
}

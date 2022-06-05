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
        self.collectionView.reloadData()
      }
    }
  }
}

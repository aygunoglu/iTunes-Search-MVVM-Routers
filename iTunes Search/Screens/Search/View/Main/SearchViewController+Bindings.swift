//
//  SearchViewController+Bindings.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

extension SearchViewController {
  final func dataUpdated() -> VoidHandler {
    return { [weak self] in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.collectionView.backgroundView = nil
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.reloadData()
      }
    }
  }
  
  final func showEmptyState() -> VoidHandler {
    return { [weak self] in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.collectionView.setEmptyMessage(Constants.emptyStateMessage)
        self.collectionView.alwaysBounceVertical = false
        self.collectionView.reloadData()
      }
    }
  }
  
  func pushViewController() -> (_ viewController: UIViewController) -> Void {
    return { [weak self] viewController in
      DispatchQueue.main.async {
        self?.navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  func popToRootViewController() -> () -> Void {
    return { [weak self] in
      self?.navigationController?.popToRootViewController(animated: true)
    }
  }

  func popViewController() -> () -> Void {
    return { [weak self] in
      self?.navigationController?.popViewController(animated: true)

    }
  }
}

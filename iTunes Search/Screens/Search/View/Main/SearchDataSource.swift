//
//  SearchDataSource.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
  let viewModel: SearchViewModelProtocol
  let actionHandler: SearchActionHandlerProtocol
  
  init(viewModel: SearchViewModelProtocol, actionHandler: SearchActionHandlerProtocol) {
    self.viewModel = viewModel
    self.actionHandler = actionHandler
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //print(viewModel.cellViewModels.count)
    return viewModel.cellViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellViewModel = viewModel.cellViewModels[indexPath.row]
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellViewModel.cellType.identifier, for: indexPath) as? SearchBaseCollectionViewCell else {
      print("error while dequeing cell")
      fatalError()
    }
    cell.viewModel = cellViewModel
    cell.actionHandler = actionHandler
    cell.configureCell()
    return cell
  }
}

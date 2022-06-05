//
//  SearchDataSource.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
  let viewModel: SearchViewModelProtocol
  
  init(viewModel: SearchViewModelProtocol) {
    self.viewModel = viewModel
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.cellViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellViewModel = viewModel.cellViewModels[indexPath.row]
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellViewModel.cellType.identifier, for: indexPath) as? SearchResultsCell else {
      print("error while dequeing cell")
      fatalError()
    }
    cell.viewModel = cellViewModel
    cell.configureCell()
    return cell
  }
}

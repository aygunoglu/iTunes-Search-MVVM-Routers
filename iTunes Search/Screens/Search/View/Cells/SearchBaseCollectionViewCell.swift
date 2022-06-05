//
//  SearchBaseCollectionViewCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

class SearchBaseCollectionViewCell: UICollectionViewCell {
  var indexPath: IndexPath!
  var actionHandler: SearchActionHandlerProtocol!
  var viewModel: SearchCellBaseViewModelProtocol!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 10
  }
  
  func configureCell() {}
  
  func willDisplay() {}
}

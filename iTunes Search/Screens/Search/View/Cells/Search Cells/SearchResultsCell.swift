//
//  SearchResultsCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit
import Kingfisher

class SearchResultsCell: SearchBaseCollectionViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func configureCell() {
    guard let viewModel = viewModel as? SearchResultCellViewModelProtocol else { return }
    containerView.backgroundColor = viewModel.backgroundColor
    titleLabel.text = viewModel.titleText
    priceLabel.text = viewModel.priceText
    releaseLabel.text = viewModel.releaseText
    
    imageView.kf.setImage(with: URL(string: viewModel.imageURL))
  }
  
  @IBAction func cellTapped(_ sender: UIButton) {
    guard let viewModel = viewModel as? SearchResultCellViewModelProtocol else { return }
    actionHandler.goToDetailVC(cellViewModel: viewModel)
  }
}

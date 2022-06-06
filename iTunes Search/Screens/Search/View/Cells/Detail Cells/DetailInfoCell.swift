//
//  DetailInfoCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 6.06.2022.
//

import UIKit

class DetailInfoCell: UITableViewCell {
  @IBOutlet weak var releaseAndKindLabel: UILabel!
  
  @IBOutlet weak var priceLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(with viewModel: SearchResultCellViewModelProtocol) {
    releaseAndKindLabel.text = viewModel.contentKind + " | " + viewModel.releaseText
    priceLabel.text = viewModel.priceText
  }
}

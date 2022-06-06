//
//  DetailTitleCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 6.06.2022.
//

import UIKit

class DetailTitleCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func configureCell(with viewModel: SearchResultCellViewModelProtocol) {
    titleLabel.text = viewModel.titleText
  }
}

//
//  DetailDescriptionCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 6.06.2022.
//

import UIKit

class DetailDescriptionCell: UITableViewCell {
  @IBOutlet weak var descriptionHeader: UILabel!
  @IBOutlet weak var descriptionBody: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(with viewModel: SearchResultCellViewModelProtocol) {
    if let descriptionText = viewModel.descriptionText {
      descriptionBody.text = descriptionText
    } else {
      descriptionBody.text = "No description found for this item."
    }
  }
}

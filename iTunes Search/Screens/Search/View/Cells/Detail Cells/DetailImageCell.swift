//
//  DetailImageCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 6.06.2022.
//

import UIKit
import Kingfisher

class DetailImageCell: UITableViewCell {
  @IBOutlet weak var artworkView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(with viewModel: SearchResultCellViewModelProtocol) {
    artworkView.kf.setImage(with: URL(string: viewModel.imageURL))
  }
}

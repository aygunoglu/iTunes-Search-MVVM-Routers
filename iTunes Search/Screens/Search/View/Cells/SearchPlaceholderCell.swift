//
//  SearchPlaceholderCell.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import UIKit

class SearchPlaceholderCell: SearchBaseCollectionViewCell {
  @IBOutlet weak var imagePlaceholder: UIView!
  @IBOutlet weak var titlePlaceholder: UIView!
  @IBOutlet weak var secondaryTitlePlaceholder: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func willDisplay() {
    super.willDisplay()
    imagePlaceholder.startShimmering()
    titlePlaceholder.startShimmering()
    secondaryTitlePlaceholder.startShimmering()
    
    actionHandler.loadNextPage()
  }
}

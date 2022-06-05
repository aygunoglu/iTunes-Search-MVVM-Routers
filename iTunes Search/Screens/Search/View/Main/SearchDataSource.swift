//
//  SearchDataSource.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    50
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsCell", for: indexPath) as? SearchResultsCell else {
      print("error while dequeing cell")
      fatalError()
    }
    cell.contentView.backgroundColor = .systemBrown
    cell.contentView.layer.cornerRadius = 10
    return cell
  }
}

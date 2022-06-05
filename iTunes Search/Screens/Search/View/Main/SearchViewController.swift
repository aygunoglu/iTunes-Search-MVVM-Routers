//
//  SearchViewController.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import UIKit

class SearchViewController: UIViewController {
  
  var manager: SearchManagerProtocol
  let searchController = UISearchController()
  
  private let collectionView: UICollectionView = {
    let viewLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    return collectionView
  }()
  
  init(manager: SearchManagerProtocol) {
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    navigationItem.title = "iTunes Search"
    navigationItem.searchController = searchController
    navigationController?.navigationBar.prefersLargeTitles = true
    
    searchController.searchResultsUpdater = self
    searchController.searchBar.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
    
    setupCollectionView()
    
    manager.viewModel.dataUpdated = dataUpdated()
    
    manager.pageProvider.requestPage(for: .initial)
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemBackground
    collectionView.delegate = self
    collectionView.dataSource = manager.dataSource
    
    collectionView.register(UINib(nibName: "SearchResultsCell", bundle: nil), forCellWithReuseIdentifier: "SearchResultsCell")
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                 collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
  }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 30) / 2
    return CGSize(width: width, height: 296)
  }
}

extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    print("hiiii")
  }
}

extension SearchViewController {
  func dataUpdated() -> VoidHandler {
    return { [weak self] in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.collectionView.reloadData()
      }
    }
  }
}



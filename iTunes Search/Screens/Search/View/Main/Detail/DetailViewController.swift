//
//  DetailViewController.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 6.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
  
  var tableView: UITableView!
  var cellViewModel: SearchResultCellViewModelProtocol
  
  init(cellViewModel: SearchResultCellViewModelProtocol) {
    self.cellViewModel = cellViewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGeneralView()
    setupTableView()
  }
  
  func setupGeneralView() {
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.title = Constants.detailVCNavigationTitle
  }
  
  func setupTableView() {
    self.tableView = UITableView(frame: .zero, style: .plain)
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .none
    
    self.tableView.allowsMultipleSelection = false
    self.tableView.backgroundColor = .systemBackground
    
    view.addSubview(tableView)
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                 self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
    
    SearchDetailCellType.allCases.forEach { cellType in
      self.tableView.register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
  }
}

// MARK: TableView Delegates
extension DetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

// MARK: Table View Data Source
extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    SearchDetailCellType.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let imageCell = tableView.dequeueReusableCell(withIdentifier: SearchDetailCellType.imageCell.identifier, for: indexPath) as? DetailImageCell else { fatalError() }
    guard let titleCell = tableView.dequeueReusableCell(withIdentifier: SearchDetailCellType.titleCell.identifier, for: indexPath) as? DetailTitleCell else { fatalError() }
    guard let infoCell = tableView.dequeueReusableCell(withIdentifier: SearchDetailCellType.infoCell.identifier, for: indexPath) as? DetailInfoCell else { fatalError() }
    guard let descriptionCell = tableView.dequeueReusableCell(withIdentifier: SearchDetailCellType.descriptionCell.identifier, for: indexPath) as? DetailDescriptionCell else { fatalError() }
    
    imageCell.configureCell(with: cellViewModel)
    titleCell.configureCell(with: cellViewModel)
    infoCell.configureCell(with: cellViewModel)
    descriptionCell.configureCell(with: cellViewModel)
    
    if indexPath.row == 0 { return imageCell }
    if indexPath.row == 1 { return titleCell }
    if indexPath.row == 2 { return infoCell }
    if indexPath.row == 3 { return descriptionCell }
    
    return UITableViewCell()
  }
}

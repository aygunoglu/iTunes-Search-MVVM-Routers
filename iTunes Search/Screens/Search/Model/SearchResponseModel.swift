//
//  SearchResponseModel.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//
import Foundation

struct SearchResponseModel: Codable {
    let resultCount: Int
    let results: [SearchItem]
}

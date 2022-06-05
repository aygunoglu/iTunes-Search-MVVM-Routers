//
//  SearchItem.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 4.06.2022.
//

import Foundation

struct SearchItem: Codable {
  let wrapperType: String?
  let kind: String
  let collectionID: Int?
  let trackID: Int?
  let artistName: String?
  let collectionName: String?
  let trackName: String
  let collectionCensoredName: String?
  let trackCensoredName: String?
  let collectionArtistID: Int?
  let collectionArtistViewURL, collectionViewURL: String?
  let trackViewURL: String?
  let previewURL: String?
  let artworkUrl60, artworkUrl100: String
  let collectionPrice: Double?
  let formattedPrice: String?
  let trackPrice: Double?
  let price: Double?
  let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
  let releaseDate: String
  let collectionExplicitness, trackExplicitness: String?
  let discCount, discNumber, trackCount, trackNumber: Int?
  let trackTimeMillis: Int?
  let country: String?
  let currency: String?
  let primaryGenreName: String?
  let contentAdvisoryRating: String?
  let shortDescription: String?
  let longDescription: String?
  let hasITunesExtras: Bool?
  
  enum CodingKeys: String, CodingKey {
    case wrapperType, kind
    case collectionID = "collectionId"
    case trackID = "trackId"
    case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
    case collectionArtistID = "collectionArtistId"
    case collectionArtistViewURL = "collectionArtistViewUrl"
    case collectionViewURL = "collectionViewUrl"
    case trackViewURL = "trackViewUrl"
    case previewURL = "previewUrl"
    case formattedPrice
    case artworkUrl60, artworkUrl100, collectionPrice, price, trackPrice, trackRentalPrice
    case collectionHDPrice = "collectionHdPrice"
    case trackHDPrice = "trackHdPrice"
    case trackHDRentalPrice = "trackHdRentalPrice"
    case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
  }
}

//
//  VideoResponse.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import Foundation

struct YoutubeResponse: Codable {
  let kind, etag, nextPageToken, prevPageToken: String?
  let regionCode: String?
  let pageInfo: PageInfo?
  let items: [VideoResponse]
}

struct VideoResponse: Codable {
  let kind, etag: String?
  let id: ID?
  let snippet: Snippet?
}

struct ID: Codable {
  let kind, videoID: String?
  
  enum CodingKeys: String, CodingKey {
    case kind
    case videoID = "videoId"
  }
}

struct Snippet: Codable {
  let id = UUID().uuidString
  let publishedAt: String?
  let channelID, title, snippetDescription: String?
  let thumbnails: Thumbnails?
  let channelTitle, liveBroadcastContent: String?
  let publishTime: String?
  
  enum CodingKeys: String, CodingKey {
    case publishedAt
    case channelID = "channelId"
    case title
    case snippetDescription = "description"
    case thumbnails, channelTitle, liveBroadcastContent, publishTime
  }
}

struct Thumbnails: Codable {
  let thumbnailsDefault, medium, high: Default?
  
  enum CodingKeys: String, CodingKey {
    case thumbnailsDefault = "default"
    case medium, high
  }
}

struct Default: Codable {
  let url: String?
  let width, height: Int?
}

struct PageInfo: Codable {
  let totalResults, resultsPerPage: Int?
}

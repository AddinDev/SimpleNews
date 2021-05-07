//
//  NewsResponse.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation

struct RemoteResponse: Codable {
  let status: String?
  let totalResults: Int?
  let news: [NewsResponse]
  
  enum CodingKeys: String, CodingKey {
    case status, totalResults
    case news = "articles"
  }
  
}

struct NewsResponse: Codable {
  let id = UUID().uuidString
  let source: SourceResponse?
  let author: String?
  let title: String?
  let articleDescription: String?
  let url: String?
  let urlToImage: String?
  let publishedAt: String?
  let content: String?
  
  enum CodingKeys: String, CodingKey {
    case source, author, title
    case articleDescription = "description"
    case url, urlToImage, publishedAt, content
  }
}

struct SourceResponse: Codable {
  let id: String?
  let name: String?
}

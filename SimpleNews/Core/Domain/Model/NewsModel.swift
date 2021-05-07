//
//  NewsModel.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation

struct NewsModel: Identifiable {
  let id: String
  let source: String
  let author: String
  let title: String
  let articleDescription: String
  let url: String
  let urlToImage: String
  let publishedAt: String
  let content: String
  
  enum CodingKeys: String, CodingKey {
    case source, author, title
    case articleDescription = "description"
    case url, urlToImage, publishedAt, content
  }
}

//
//  NewsModel.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation

struct NewsModel: Identifiable, Equatable {
  let id: String
  let source: String
  let author: String
  let title: String
  let description: String
  let url: String
  let imageUrl: String
  let published: String
  let content: String
  
  enum CodingKeys: String, CodingKey {
    case source, author, title
    case url, articleDescription, content
    case imageUrl = "urlToImage"
    case published = "publishedAt"
  }
}

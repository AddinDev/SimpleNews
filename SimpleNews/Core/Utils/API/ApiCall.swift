//
//  ApiCall.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import Foundation

struct Api {
  static let key = "&apiKey=5b0cc15b1d0b473597daa6bf54ac5348"
  private static let baseUrl = "https://newsapi.org/v2/"
  private static let topHeadlines = "top-headlines?country=id"
  private static let search = "everything?q="

  static let homeApi = "\(baseUrl)\(topHeadlines)"
  static let topNewsApi = "\(baseUrl)\(search)"
}

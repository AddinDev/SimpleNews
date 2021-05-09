//
//  ApiCall.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import Foundation

struct Api {
  
  static let newsKey = "&apiKey=5b0cc15b1d0b473597daa6bf54ac5348"
  
  private static let newsBaseUrl = "https://newsapi.org/v2/"
  private static let topHeadlines = "top-headlines?country=id"
  private static let newsSearch = "everything?q="
  
  static let homeApi = "\(newsBaseUrl)\(topHeadlines)"
  static let topNewsApi = "\(newsBaseUrl)\(newsSearch)"
  
  static let youtubeKey = "&type=video&key=AIzaSyD-6C-J66zB693n-r_n6BFVDSEoyRglf_0"
  
  private static let youtubeBaseUrl = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10"
   static let youtubeToken = "&pageToken="
   static let youtubeSearch = "&q="
  
  static let youtubeApi = "\(youtubeBaseUrl)"
  
}

//
//  NewsMapper.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation

class NewsMapper {
  
  static func responseToModel(for responses: [NewsResponse]) -> [NewsModel] {
    return responses.map { response in
      return NewsModel(id: response.id,
                       source: response.source?.name ?? "unknown",
                       author: response.author ?? "unknown",
                       title: response.title ?? "unknown",
                       description: response.articleDescription ?? "unknown",
                       url: response.url ?? "unknown",
                       imageUrl: response.urlToImage ?? "unknown",
                       published: formatDate(response.publishedAt ?? "unknown"),
                       content: response.content ?? "unknown")
    }
  }
  
  static func formatDate(_ date: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    let dateFormatterPrint = DateFormatter()
//    dateFormatterPrint.dateFormat = "HH:mm"
    dateFormatterPrint.dateFormat = "HH:mm - EEEE, MMM d, yyyy"
    
    if let date = dateFormatterGet.date(from: date) {
      return dateFormatterPrint.string(from: date)
    } else {
      print("There was an error decoding the string")
    }
    return "unknown"
  }
 
}

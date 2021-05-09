//
//  NewsDetailUseCase.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import Foundation
import Combine

protocol NewsDetailUseCase {
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoModel], Error>
}

class NewsDetailInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension NewsDetailInteractor: NewsDetailUseCase {
  
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoModel], Error> {
    self.repository.getYoutubeVideos(pageToken: pageToken, topic: topic)
  }
  
}

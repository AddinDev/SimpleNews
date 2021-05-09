//
//  Repository.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  func getNews() -> AnyPublisher<[NewsModel], Error>
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsModel], Error>
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoModel], Error>
}

class Repository {
  
  typealias Repo = (RemoteDataSource) -> Repository
  
  fileprivate let remote: RemoteDataSource
  
  init(remote: RemoteDataSource) {
    self.remote = remote
  }
  
  static let sharedInstance: Repo = { remote in
    return Repository(remote: remote)
  }
  
}

extension Repository: RepositoryProtocol {
  
  func getNews() -> AnyPublisher<[NewsModel], Error> {
    self.remote.getNews()
      .map { NewsMapper.responseToModel(for: $0) }
      .eraseToAnyPublisher()
  }
  
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsModel], Error> {
    self.remote.getTopNews(topic)
      .map { NewsMapper.responseToModel(for: $0) }
      .eraseToAnyPublisher()
  }
  
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoModel], Error> {
    self.remote.getYoutubeVideos(pageToken: pageToken, topic: topic)
      .map { VideoMapper.responseToModel(for: $0) }
      .eraseToAnyPublisher()
    
  }
  
}

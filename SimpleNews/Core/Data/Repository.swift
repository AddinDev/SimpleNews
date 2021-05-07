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
  
}

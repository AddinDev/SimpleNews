//
//  TopNewsUseCase.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import Foundation
import Combine

protocol TopNewsUseCase {
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsModel], Error>
}

class TopNewsInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension TopNewsInteractor: TopNewsUseCase {
  
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsModel], Error> {
    self.repository.getTopNews(topic)
  }
  
}

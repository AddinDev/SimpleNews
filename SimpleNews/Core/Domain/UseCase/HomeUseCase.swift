//
//  HomeUseCase.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation
import Combine

protocol HomeUseCase {
  func getNews() -> AnyPublisher<[NewsModel], Error>
}

class HomeInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeInteractor: HomeUseCase {
  
  func getNews() -> AnyPublisher<[NewsModel], Error> {
    self.repository.getNews()
  }
  
}

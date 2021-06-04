//
//  SearchNewsUseCase.swift
//  SimpleNews
//
//  Created by addin on 11/05/21.
//

import Foundation
import Combine

protocol SearchNewsUseCase {
  func searchNews(_ word: String) -> AnyPublisher<[NewsModel], Error>
}

class SearchNewsInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension SearchNewsInteractor: SearchNewsUseCase {
  
  func searchNews(_ word: String) -> AnyPublisher<[NewsModel], Error> {
    self.repository.searchNews(word)
  }
  
}

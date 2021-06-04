//
//  Injection.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation
import Combine

class Injection {
  
  func provideRepo() -> Repository {
    let remote = RemoteDataSource.sharedInstance
    return Repository(remote: remote)
  }
  
  func provideHome() -> HomeUseCase {
    return HomeInteractor(repository: provideRepo())
  }
  
  func provideTopNews() -> TopNewsUseCase {
    return TopNewsInteractor(repository: provideRepo())
  }
  
  func provideSearchNews() -> SearchNewsUseCase {
    return SearchNewsInteractor(repository: provideRepo())
  }
  
  func provideNewsDetail() -> NewsDetailUseCase {
    return NewsDetailInteractor(repository: provideRepo())
  }
  
}

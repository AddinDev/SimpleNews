//
//  RemoteDataSource.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol {
  func getNews() -> AnyPublisher<[NewsResponse], Error>
}

class RemoteDataSource {
  
  static let sharedInstance = RemoteDataSource()
  init() { }
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getNews() -> AnyPublisher<[NewsResponse], Error> {
    print("getting news")
    return Future<[NewsResponse], Error> { completion in
      guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=5b0cc15b1d0b473597daa6bf54ac5348") else { return }
      AF.request(url)
        .validate()
        .responseDecodable(of: RemoteResponse.self) { response in
          print(response.result)
          switch response.result {
          case .failure(let error):
            completion(.failure(error))
            print(error.localizedDescription)
          case .success(let value):
            completion(.success(value.news))
            print(value)
          }
        }
    }.eraseToAnyPublisher()
  }
  
}

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
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsResponse], Error>
}

class RemoteDataSource {
  
  static let sharedInstance = RemoteDataSource()
  init() { }
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getNews() -> AnyPublisher<[NewsResponse], Error> {
    print("getting news")
    return Future<[NewsResponse], Error> { completion in
      guard let url = URL(string: Api.homeApi + Api.key) else { return }
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
  
  func getTopNews(_ topic: String) -> AnyPublisher<[NewsResponse], Error> {
    print("getting top news")
    return Future<[NewsResponse], Error> { completion in
      guard let url = URL(string: Api.topNewsApi + topic + Api.key) else { return }
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
    }.eraseToAnyPublisher()  }
  
}

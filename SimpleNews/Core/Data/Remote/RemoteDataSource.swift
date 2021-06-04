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
  func searchNews(_ word: String) -> AnyPublisher<[NewsResponse], Error>
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoResponse], Error>
}

class RemoteDataSource {
  
  static let sharedInstance = RemoteDataSource()
  init() { }
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {

  func getNews() -> AnyPublisher<[NewsResponse], Error> {
    print("getting news")
    return Future<[NewsResponse], Error> { completion in
      guard let url = URL(string: Api.homeApi + Api.newsKey) else { return }
      AF.request(url)
        .validate()
        .responseDecodable(of: RemoteResponse.self) { response in
          switch response.result {
          case .failure(let error):
            completion(.failure(error))
            print(error.localizedDescription)
          case .success(let value):
            completion(.success(value.news))
          }
        }
    }.eraseToAnyPublisher()
  }
  
  func searchNews(_ word: String) -> AnyPublisher<[NewsResponse], Error> {
    return Future<[NewsResponse], Error> { completion in
      guard let url = URL(string: Api.searchNewsApi + word + Api.newsKey) else { return }
      AF.request(url)
        .validate()
        .responseDecodable(of: RemoteResponse.self) { response in
          switch response.result {
          case .failure(let error):
            completion(.failure(error))
            print(error.localizedDescription)
          case .success(let value):
            completion(.success(value.news))
          }
        }
    }.eraseToAnyPublisher()
  }
  
  func getYoutubeVideos(pageToken: String, topic: String) -> AnyPublisher<[VideoResponse], Error> {
    print("getting videos")
    return Future<[VideoResponse], Error> { completion in
      guard let url = URL(string: Api.youtubeApi + Api.youtubeToken + pageToken + Api.youtubeSearch + topic + Api.youtubeKey) else { return print("what") }
      print(url)
      AF.request(url)
        .validate()
        .responseDecodable(of: YoutubeResponse.self) { response in
          print("result: \(response.result)")
          switch response.result {
          case .failure(let error):
            completion(.failure(error))
            print(error.localizedDescription)
          case .success(let value):
            completion(.success(value.items))
          }
        }
    }.eraseToAnyPublisher()
  }

}

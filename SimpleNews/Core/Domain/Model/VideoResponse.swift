//
//  YoutubeModel.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import Foundation

struct VideoResponse: Identifiable, Equatable {
  let id: String
  let nextPageToken: String
  let prevPageToken: String
  let regionCode: String
  let totalResult: String
  let published: String
  let title: String
  let description: String
  let thumbnail: String
  let channel: String
  let videoId: String
}

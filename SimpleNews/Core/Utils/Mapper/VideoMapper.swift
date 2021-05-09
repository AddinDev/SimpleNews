//
//  VideoMapper.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import Foundation

class VideoMapper {
  
  static func responseToModel(for videos: [VideoResponse]) -> [VideoModel] {
    return videos.map { video in
      return VideoModel(id: video.snippet?.id ?? "",
                        published: video.snippet?.publishTime ?? "",
                        title: video.snippet?.title ?? "",
                        description: video.snippet?.snippetDescription ?? "",
                        thumbnail: video.snippet?.thumbnails?.medium?.url ?? "",
                        channel: video.snippet?.channelTitle ?? "",
                        videoId: video.id?.videoID ?? "" )
    }
  }
  
}

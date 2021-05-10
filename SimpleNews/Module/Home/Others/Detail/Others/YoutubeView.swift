//
//  YoutubeView.swift
//  SimpleNews
//
//  Created by addin on 11/05/21.
//

import SwiftUI

struct YoutubeView: View {
  
  let video: VideoModel

  var body: some View {
    content
      .navigationBarTitle(video.channel, displayMode: .inline)
  }
  
}

extension YoutubeView {
  
  var content: some View {
    WebView(url: "https://youtu.be/\(video.videoId)")
  }
  
}

//
//  DetailRouter.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI

struct DetailRouter {
  
  func makeWebView(_ source: String, _ url: String) -> some View {
    return
      WebView(url: url)
      .navigationBarTitle(source)
  }
  
}

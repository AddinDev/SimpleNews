//
//  WebView.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  
  let url: String
  
  func makeUIView(context: Context) -> WKWebView {
    
    let prefs = WKWebpagePreferences()
    prefs.allowsContentJavaScript = true
    let config = WKWebViewConfiguration()
    config.defaultWebpagePreferences = prefs
    let webView = WKWebView(frame: .zero,
                            configuration: config)
    webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
      for cookie in cookies {
        if cookie.name == "authentication" {
          webView.configuration.websiteDataStore.httpCookieStore.delete(cookie)
        } else {
          print("\(cookie.name) is set to \(cookie.value)")
        }
      }
    }
    return webView
  }
    
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let url = URL(string: url) else { return }
    let request = URLRequest(url: url)
    uiView.load(request)
  }
  
}

extension WKWebView {
  
  func cleanAllCookies() {
    HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
    print("All cookies deleted")
    
    WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
      records.forEach { record in
        WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
        print("Cookie ::: \(record) deleted")
      }
    }
  }
  
  func refreshCookies() {
    self.configuration.processPool = WKProcessPool()
  }
  
}

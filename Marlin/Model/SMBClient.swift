//
//  SMBClient.swift
//  Marlin
//
//  Created by Valeriy Soltan on 1/18/21.
//

import AMSMB2

class SMBClient {
  
  var serverURL: URL
  var credential: URLCredential
  var share: String
  
  init(serverURL: URL, credential: URLCredential, share: String) {
    self.serverURL = serverURL
    self.credential = credential
    self.share = share
  }
    
  lazy private var client = AMSMB2(url: self.serverURL, credential: self.credential)!
    
  private func connect(handler: @escaping (Result<AMSMB2, Error>) -> Void) {
      // AMSMB2 can handle queueing connection requests
    client.connectShare(name: self.share) { error in
      if let error = error {
          handler(.failure(error))
      } else {
          handler(.success(self.client))
      }
    }
  }
    
  func listDirectory(path: String) {
    connect { result in
      switch result {
        case .success(let client):
          client.contentsOfDirectory(atPath: path) { result in
            switch result {
            case .success(let files):
              for entry in files {
                print("name:", entry[.nameKey] as! String,
                      ", path:", entry[.pathKey] as! String,
                      ", type:", entry[.fileResourceTypeKey] as! URLFileResourceType,
                      ", size:", entry[.fileSizeKey] as! Int64,
                      ", modified:", entry[.contentModificationDateKey] as! Date,
                      ", created:", entry[.creationDateKey] as! Date)
              }
            case .failure(let error):
              print(error)
            }
          }
        case .failure(let error):
          print(error)
      }
    }
  }

  func directoryContents(at path: String, completionHandler: @escaping ([[URLResourceKey : Any]]?, Error?) -> Void) {
    self.connect { result in
      switch result {
      case .success(let client):
        client.contentsOfDirectory(atPath: path) { result in
          switch result {
          case .success(let files):
            completionHandler(files, nil)
          case .failure(let error):
            completionHandler(nil, error)
          }
        }
      case .failure(let error):
        completionHandler(nil, error)
      }
    }
  }
  
  func downloadBuffer(path: String, url: URL) {
    self.connect { result in
      switch result {
      case .success(let client):
        client.downloadItem(atPath: path, to: url) { (_ bytes: Int64, _ total: Int64) -> Bool in
          print("downloaded: \(bytes) bytes out of \(total)")
          if (bytes <= total) {
            return true
          }
          return false
        } completionHandler: { err in
          if err != nil {
            print(err!)
          } else {
            print("Successfully downloaded item")
            NSWorkspace.shared.open(url)
          }
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}

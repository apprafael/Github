//
//  RepositoriesWorker.swift
//  Github
//
//  Created by Rafael Almeida on 28/03/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class RepositoriesWorker
{
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    var tracks: Repository?
    //
    // MARK: - Type Alias
    //
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = (Repository?, String) -> Void
    
    func getRepositories(completion: @escaping QueryResult) {
      dataTask?.cancel()
      
      if let urlComponents = URLComponents(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1") {
        
        guard let url = urlComponents.url else {
          return
        }
      
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
          defer {
            self?.dataTask = nil
          }
          
          if let error = error {
            self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
          } else if
            let data = data,
            let response = response as? HTTPURLResponse,
            response.statusCode == 200 {
            
            
                let repositories = try! JSONDecoder().decode(Repository.self, from: data)
            

            DispatchQueue.main.async {
              completion(repositories, self?.errorMessage ?? "")
            }
          }
        }
        
        dataTask?.resume()
      }
    }
}

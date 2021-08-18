//
//  RepoAPIService.swift
//  Repo3
//
//  Created by Jefferson Miralles on 8/15/21.
//

import Foundation

protocol RepoAPIServiceProtocol {
	func searchRepos(query: String, completion: @escaping (Result<[Item], Error>) -> Void)
}

final class RepoAPIService: RepoAPIServiceProtocol {
	func searchRepos(query: String, completion: @escaping (Result<[Item], Error>) -> Void) {
		guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { fatalError("URL is not correct") }
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			
			guard let data = data else { fatalError() }
			
			do {
				let repositories = try JSONDecoder().decode(Repositories.self, from: data)
				completion(.success(repositories.items))
			} catch {
				completion(.failure(error))
			}
			
		}.resume()
	}
}

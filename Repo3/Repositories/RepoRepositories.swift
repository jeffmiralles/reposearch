//
//  RepoRepositories.swift
//  Repo3
//
//  Created by Jefferson Miralles on 8/15/21.
//

import Foundation

protocol RepoRepositoriesProtocol {
	func searchRepos(query: String, completion: @escaping (Result<[Item], Error>) -> Void)
}

final class RepoRepositories: RepoRepositoriesProtocol {
	
	private let apiService: RepoAPIServiceProtocol
	
	init(apiService: RepoAPIServiceProtocol = RepoAPIService()) {
		self.apiService = apiService
	}
	
	func searchRepos(query: String, completion: @escaping (Result<[Item], Error>) -> Void) {
		apiService.searchRepos(query: query, completion: completion)
	}
}

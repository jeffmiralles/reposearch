//
//  MockRepoAPIService.swift
//  Repo3Tests
//
//  Created by Jefferson Miralles on 8/15/21.
//

import Foundation
@testable import Repo3

class MockRepoAPIService: RepoAPIServiceProtocol {
	func searchRepos(query: String, completion: @escaping (Result<[Item], Error>) -> Void) {
		let repos = [
			Item(id: 0, fullname: "Apple/Swift"),
			Item(id: 1, fullname: "Alamofire/Alomofire")
		]
		completion(.success(repos))
	}
	
	
}

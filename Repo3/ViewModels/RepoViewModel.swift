//
//  RepoViewModel.swift
//  Repo3
//
//  Created by Jefferson Miralles on 8/15/21.
//

import Foundation

final class RepoViewModel: ObservableObject {
	@Published var items: [Item] = []
	
	private let repository: RepoRepositoriesProtocol
	
	init(repository: RepoRepositoriesProtocol = RepoRepositories()) {
		self.repository = repository
	}
	
	/// DOOOOCUUUUUMENNNTAAATIOOONNNNNN
	///
	///
	
	func search(query: String, completion: @escaping (Error?) -> Void) {
		repository.searchRepos(query: query) { [weak self] result in
			switch result {
			case .success(let items):
				DispatchQueue.main.async {
					self?.items = items
					completion(nil)
				}
			case .failure(let error):
				completion(error)
			}
		}
	}
}

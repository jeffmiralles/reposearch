//
//  RepoView.swift
//  Repo3
//
//  Created by Jefferson Miralles on 8/15/21.
//

import SwiftUI

struct RepoView: View {
	@StateObject var repoViewModel: RepoViewModel
	@State private var search = ""
	@State private var loading = false
	
	init(repoViewModel: RepoViewModel = .init()) {
		_repoViewModel = StateObject(wrappedValue: repoViewModel)
	}
	
	var body: some View {
		VStack {
			TextField("Placeholder", text: $search)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.autocapitalization(.none)
				.disableAutocorrection(true)
				
			Button("Search") {
				loading = true
				repoViewModel.search(query: search) { error in
					loading = false
				}
			}
			
			Text("Hello  asdasdasd")
				.shadow(color: .black.opacity(1), radius: 1.1, x: 0, y: 5)
			
			ZStack(alignment: .top) {
				List(repoViewModel.items) { item in
					Text(item.fullname)
				}
				
				if loading {
					ProgressView()
				}
			}
		}
		.padding()
	}
}

struct RepoView_Previews: PreviewProvider {
	static var previews: some View {
		RepoView()
	}
}

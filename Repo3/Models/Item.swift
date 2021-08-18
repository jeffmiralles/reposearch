//
//  Item.swift
//  Repo3
//
//  Created by Jefferson Miralles on 8/15/21.
//

import Foundation

struct Repositories: Decodable {
	let items: [Item]
}

struct Item: Codable, Identifiable {
	let id: Int
	let fullname: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case fullname = "full_name"
	}
}

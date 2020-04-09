//
//  QiitaStruct.swift
//  PracticeList
//
//  Created by kosuke-kihara on 2020/03/31.
//  Copyright © 2020 kosuke kihara. All rights reserved.
//

import UIKit

struct QiitaStruct: Codable {
    let rendered_body: String
    let body: String
    let coediting: Bool
    let comments_count: Int
    let created_at: String
    let group: GroupItem?
    
    struct GroupItem: Codable {
        let created_at: String?
        let id: Int?
        let name: String?
        let `private`: Bool?
        let updated_at: String?
        let url_name: String?
    }
    
    let id: String
    let likes_count: Int
    let `private`: Bool
    let reactions_count: Int
//    let tags: TagItem
//
//    struct TagItem: Codable {
//        let name: String?
//        let versions: [String]?
//    }
    
    let title: String
    let updated_at: String
    let url: String
    let user: UserItem
    
    struct UserItem: Codable {
        let description: String?
        let facebook_id: String?
        let followees_count: Int?
        let folloewers_count: Int?
        let github_login_name: String?
        let id: String?
        let items_count: Int?
        let linkedin_id: String?
        let location: String?
        let name: String?
        let organization: String?
        let permanent_id: Int?
        let profile_image_url: String?
        let team_only: Bool?
        let twitter_screen_name: String?
        let website_url: String?
    }
    
//    let page_views_count: Int
}

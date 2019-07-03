//
//  Repo.swift
//  MVVM
//
//  Created by Govindharaj Murugan on 7/03/19.
//  Copyright © 2019 Govindharaj Murugan . All rights reserved.
//

import Foundation

class Repo {

    let name:String
    let url:String
    let desc:String?
    let starCount:Int
    let forkCount:Int
    
    init(name:String,url:String,desc:String,starCount:Int,forkCount:Int) {
        self.name=name
        self.url=url
        self.desc=desc
        self.starCount=starCount
        self.forkCount=forkCount
    }
    
}

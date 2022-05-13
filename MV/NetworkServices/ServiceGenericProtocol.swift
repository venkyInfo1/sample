//
//  ServiceGenericProtocol.swift
//  MV
//
//  Created by Apple on 12/05/22.
//

import Foundation
protocol ServiceGenericProtocol {
    associatedtype T
    func getData(_ urlStr:String,completion: @escaping (T,String?) -> Void)
}


//
//  HTTPController.swift
//  DBDB
//
//  Created by 大可立青 on 15/7/6.
//  Copyright © 2015年 大可立青. All rights reserved.
//
import UIKit
import Alamofire

class HTTPController{
    
    var delegate:HttpProtocol?
    
    func onSearch(url:String){
        Alamofire.request(Method.GET, URLString: url).responseJSON(NSJSONReadingOptions.MutableContainers) { (_, _, data, error) -> Void in
            self.delegate?.didRecieveResults(data!)
        }
    }
}

protocol HttpProtocol{
    func didRecieveResults(results:AnyObject)
}

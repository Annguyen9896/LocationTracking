//
//  SendLiveLocation.swift
//  Location App
//
//  Created by An Nguyen on 4/19/20.
//  Copyright © 2020 An Nguyen. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case otherProblem
    case encodingProblem
}

struct SendLiveLocation{
    let resourceURL: URL
    
    init(endpoint: String){
        let resourceString = "http://translocationserver.eastus.cloudapp.azure.com:3000/\(endpoint)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
     func summit (_ locationToSend: Location, completion: @escaping(Result<String, APIError>)->Void){
            do {
                var urlRequest = URLRequest(url: resourceURL)
                urlRequest.httpMethod = "POST"
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = try JSONEncoder().encode(locationToSend)
                
                let task = URLSession.shared.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                    DispatchQueue.main.async {
                        if error != nil{
                                return
                            }
                            do{
                                let status = String(data: data!, encoding: String.Encoding.utf8) // the data will be converted to the string
                                if(status == "Message added to consumable queue!\n"){
                                    completion(.success("Location successfully uploaded"))}
                            }
                        }
                    }
                task.resume()

                    
                    
            }catch{
                completion(.failure(.encodingProblem))
            }
        }
    }


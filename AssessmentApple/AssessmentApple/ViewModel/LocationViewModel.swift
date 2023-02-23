//
//  LocationViewModel.swift
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/23/23.
//

import Foundation

class LocationViewModel {
    
    
    func getData( onCompletionHandler: @escaping((Double,Double)->Void)) {
        
        NetworkManager.sharedApiHandler().loadData { response ,error  in
            do {
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    
                } else {
                    let responseModel =  try JSONDecoder().decode(LocationModel.self, from: response as! Data)
                    if let lat = Double((responseModel.iss_position?.latitude)!), let long = Double((responseModel.iss_position?.longitude)!) {
                        onCompletionHandler(lat,long)
                    }
                }
            } catch {
                print("Exception!")
            }
        }
        
    }
    
    
}

//
//  ApiService.swift
//  ModelViewViewModelApp
//
//  Created by Phincon on 13/03/23.
//

import Foundation

//step 1
// buat protocol untuk abstraction
protocol ApiServiceEmployeeProtocol {
    var url: String { get } // untuk nampung url
    func callApi(completion: @escaping(ListEmployee?) -> Void) // function yg didalem nya untuk handle networking
}

// step 2
// implement protocol
struct ApiServiceEmployee: ApiServiceEmployeeProtocol {
    var url: String
    
    init(url: String) {
        // step 3
        // init url
        self.url = url
    }
    
    func callApi(completion: @escaping (ListEmployee?) -> Void) {
        // step 4
        // buat url dari string
        guard let iniUntukHitURL = URL(string: self.url) else { return }
        
        //if let url = URL(string: self.url) { // logic dalem sini }
        
        // step 5
        // buat UrlSession untuk handle api
        URLSession.shared.dataTask(with: iniUntukHitURL) { buatSuccessdata, responseStatus, kaloDapetError in
            if let suksesNich = buatSuccessdata {
                // step 6: buat do catch dulu
                do {
                    //step 7: bikin decoder, parsing data ke model, masukin completion
                    let decoder = JSONDecoder()
                    let modelData = try decoder.decode(ListEmployee.self, from: suksesNich)
                    print("model data", modelData)
                    completion(modelData)
                    
                } catch {
                    // step 8: handle kalo parsing data nya error
                    print("model data error")
                    completion(nil)
                }
            } else if let error = kaloDapetError {
                print("ini error ", error)
            }
            /// si resume ini jangan sampe lupa
        }.resume()
    }
}

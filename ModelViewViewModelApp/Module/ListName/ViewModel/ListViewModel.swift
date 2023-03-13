//
//  ListViewModel.swift
//  ModelViewViewModelApp
//
//  Created by Phincon on 13/03/23.
//

import Foundation

protocol ListViewProtocol {
    var urlString: String { get }
    var bindEmployeeData: ((ListEmployee?) -> ())? { get set }
    func fetchDataEmployee()
}

class ListViewModel: ListViewProtocol {
    // buat property untuk api service
    private let apiService: ApiServiceEmployee?
    var urlString: String
    var data: ListEmployee?
    // buat ngambil url
    
    // ini digunakan untuk callback, misalkan dia udah ke update data nya
    var bindEmployeeData: ((ListEmployee?) -> Void)?
    
    // init properties yg diinginkan
    init(urlString: String) {
        self.urlString = urlString
        self.apiService = ApiServiceEmployee(url: self.urlString)
        
        // panggil function untuk fetch api data
        fetchDataEmployee()
    }
    
    // buat function untuk manggil dan parsing data dari api
    func fetchDataEmployee() {
        // data listmodel ini optional
        self.apiService?.callApi(completion: { listData in
            if let model = listData {
                print("list model ", listData)
                self.data = model
                self.bindEmployeeData?(model)
            } else {
                self.bindEmployeeData?(nil)
            }
        })
    }
    
    func numberOfRowsInSection() -> Int {
        return self.data?.data.count ?? 0
    }
}

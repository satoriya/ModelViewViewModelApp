//
//  ListModel.swift
//  ModelViewViewModelApp
//
//  Created by Phincon on 13/03/23.
//

import Foundation

// create main model
struct ListEmployee: Codable {
    let status: String
    let message: String
    let data: [DataEmployee]
}
// create nested data
struct DataEmployee: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary: Int
    let employeeAge: Int
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

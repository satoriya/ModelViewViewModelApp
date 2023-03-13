//
//  ViewController.swift
//  ModelViewViewModelApp
//
//  Created by Phincon on 13/03/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ListViewModel?
    private var modelList: ListEmployee?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        
        self.viewModel = ListViewModel(urlString: "https://dummy.restapiexample.com/api/v1/employees")

        self.viewModel?.bindEmployeeData = { listModel in
            if let listModel = listModel {
                self.modelList = listModel
                self.tableView.backgroundColor = .white
            } else {
                self.tableView.backgroundColor = .red
            }
            print("reload data")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewTableViewCell", for: indexPath) as? ListViewTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = self.modelList?.data[indexPath.row].employeeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.modelList?.data.count ?? 0
        print("count ", count
        )
        return count
    }
}

extension ListViewController {
    
    fileprivate func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListViewTableViewCell", bundle: nil), forCellReuseIdentifier: "ListViewTableViewCell")
        tableView.backgroundColor = .white
    }
}

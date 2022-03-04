//
//  TaskListViewController.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 4/3/22.
//

import UIKit

class TaskListViewController: UIViewController {

    var downloads: [DownloadNewModel]?
    
    @IBOutlet weak var myListaTareasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()

        // Do any additional setup after loading the view.
    }

    func setupView() {
        SaveFavoritesPresenter.shared.getAllLocal { (results) in
            self.downloads = results?.downloads
        } failure: { (error) in
            print(error ?? "AQUI JUANMA")
        }
    }

    func setupTableView(){
        self.myListaTareasTableView.delegate = self
        self.myListaTareasTableView.dataSource = self
        self.myListaTareasTableView.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myListaTareasTableView.reloadData()
    }

}
extension TaskListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.downloads?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDownload = self.myListaTareasTableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath) as! TaskListCell
        cellDownload.myNombreLBL.text = self.downloads?[indexPath.row].newTask
        return cellDownload
    }
}

/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

protocol GrouponListViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class GrouponListViewController: UIViewController, ViewInterface {

    // MARK: - Dependencias
    var presenter: GrouponListPresenterViewInterface!
    
	// MARK: - IBOutlets
	@IBOutlet weak var cuponListTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.presenter.updateView()
		self.setupTableView()
    }

	func setupTableView() {
		self.cuponListTableView.delegate = self
		self.cuponListTableView.dataSource = self
		self.cuponListTableView.register(UINib(nibName: GrouponCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GrouponCell.defaultReuseIdentifierView)
	}
	
}

extension GrouponListViewController: GrouponListViewPresenterInterface {

    func reloadInformationInView() {
		self.cuponListTableView.reloadData()
    }
}

extension GrouponListViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.presenter.numberOfRow()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellCupon = self.cuponListTableView.dequeueReusableCell(withIdentifier: GrouponCell.defaultReuseIdentifierView, for: indexPath) as! GrouponCell
		if let model = self.presenter.objectFor(index: indexPath.row) {
			cellCupon.configCell(data: model)
		}
		return cellCupon
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter.showDetailViewController(index: indexPath.row)
	}
	
}

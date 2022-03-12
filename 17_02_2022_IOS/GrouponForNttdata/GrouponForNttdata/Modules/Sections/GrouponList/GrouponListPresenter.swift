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

import Foundation

protocol GrouponListPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol GrouponListPresenterInteractorInterface: PresenterInteractorInterface {
	func getDataFromInteractor(data: [DataViewModel]?)
}

protocol GrouponListPresenterViewInterface: PresenterViewInterface {
	func updateView()
    func numberOfRow() -> Int
	func objectFor(index: Int) -> CardViewModel?
	func showDetailViewController(index: Int)
}

final class GrouponListPresenter: PresenterInterface {
    
    var router: GrouponListRouterPresenterInterface!
    var interactor: GrouponListInteractorPresenterInterface!
    weak var view: GrouponListViewPresenterInterface!
    
    var arrayData: [DataViewModel] = []
    
}

extension GrouponListPresenter: GrouponListPresenterRouterInterface {
    
}

extension GrouponListPresenter: GrouponListPresenterInteractorInterface {
	func getDataFromInteractor(data: [DataViewModel]?) {
		if let dataDes = data {
			self.arrayData = dataDes
			self.view.reloadInformationInView()
		}
	}
}

extension GrouponListPresenter: GrouponListPresenterViewInterface {
	
	func showDetailViewController(index: Int) {
		if let dataModel = self.arrayData[index].data {
			self.router.showDetailViewController(data: dataModel)
		}
	}
	
	func updateView() {
		self.view.reloadInformationInView()
	}
	
	func numberOfRow() -> Int {
		self.arrayData.count
	}
	
	func objectFor(index: Int) -> CardViewModel? {
		self.arrayData[index].data
	}
	
}

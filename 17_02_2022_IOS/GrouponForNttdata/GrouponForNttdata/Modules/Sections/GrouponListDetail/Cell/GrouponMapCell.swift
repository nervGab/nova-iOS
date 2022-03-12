//
//  GrouponMapCell.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import UIKit
import MapKit

protocol GrouponMapCellProtocol {
	func configCell(model: CardViewModel)
}

class GrouponMapCell: UITableViewCell, ReuseIdentifierView {

	//MARK: - IBOutlet
	@IBOutlet weak var myMapView: MKMapView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension GrouponMapCell: GrouponMapCellProtocol {

	func configCell(model: CardViewModel) {
		// 1 -> Creamos un punto en el mapa
		let latitude: CLLocationDegrees = model.division?.lat ?? 0.0
		let longitude: CLLocationDegrees = model.division?.lng ?? 0.0
		// 2 -> Creamos el Zoom
		let latDelta: CLLocationDegrees = 0.001
		let longDelta: CLLocationDegrees = 0.001
		// 3 -> Unimos la localizacion y el Zoom
		let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
		let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
		
		self.myMapView.setRegion(region, animated: false)
		
		// 4 -> Chincheta
		let annotation = MKPointAnnotation()
		annotation.coordinate = location
		annotation.title = model.division?.name
		annotation.subtitle = "Te encuentras aqui"
		
		self.myMapView.addAnnotation(annotation)
	}
	
}

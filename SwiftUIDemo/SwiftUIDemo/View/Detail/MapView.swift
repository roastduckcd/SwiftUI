//
//  MapView.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/31.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    var coordinate: CLLocationCoordinate2D

    typealias UIViewType = MKMapView

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {

        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }

}

#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 30.64242, longitude: 104.04311))
    }
}
#endif

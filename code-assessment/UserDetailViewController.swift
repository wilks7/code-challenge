//
//  UserDetailViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import UIKit
import MapKit

class UserDetailViewController: UIViewController {

    var user: User?
    
    @IBOutlet var mapView: MKMapView!
    
    
    @IBOutlet var nameOutlet: UILabel!
    @IBOutlet var usernameOutlet: UILabel!
    @IBOutlet var idOutlet: UILabel!
    @IBOutlet var emailOutlet: UILabel!
    @IBOutlet var phoneOutlet: UILabel!
    @IBOutlet var websiteOutlet: UILabel!
    
    @IBOutlet var totalPostsOutlet: UILabel!
    
    @IBOutlet var streetOutlet: UILabel!
    @IBOutlet var suiteOutlet: UILabel!
    @IBOutlet var cityOutlet: UILabel!
    @IBOutlet var zipOutlet: UILabel!
    
    @IBOutlet var latlongOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {return}
        nameOutlet.text = user.name
        usernameOutlet.text = user.username
        if let id = user.id {
            idOutlet.text = "uid: \(id)"
            let totalPosts = Singleton.sharedController.countPosts(uid: id)
            totalPostsOutlet.text = "Posts: \(totalPosts)"
            
        }
        emailOutlet.text = user.email
        phoneOutlet.text = user.phone
        websiteOutlet.text = user.website
        
        if let street = user.address["street"] as? String,
            let suite = user.address["suite"] as? String,
            let city = user.address["city"] as? String,
            let zip = user.address["zipcode"] as? String {
            
            streetOutlet.text = street
            suiteOutlet.text = suite
            cityOutlet.text = city
            zipOutlet.text = zip
        }
        if let geo = user.address["geo"] as? NSDictionary{
            if let lat = geo["lat"] as? String,
                let lng = geo["lng"] as? String {
                
                latlongOutlet.text = "\(lat), \(lng)"
                
                //assumes the lat/lng will be correct
                let latDouble = Double(lat)!
                let lngDouble = Double(lng)!

                
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latDouble, longitude: lngDouble)
                self.mapView.addAnnotation(annotation)
                self.mapView.reloadInputViews()
            }
        }
    }
}

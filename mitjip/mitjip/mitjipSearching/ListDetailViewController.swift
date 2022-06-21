//
//  ListDetailViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/17.
//

import UIKit
import MapKit
class ListDetailViewController: UIViewController {
    @IBOutlet var mapView : MKMapView!
    @IBOutlet var foodTitle : UILabel!
    @IBOutlet var foodCategory : UILabel!
    @IBOutlet var foodAddress : UILabel!
    @IBOutlet var foodRoadAddress : UILabel!
    @IBOutlet var foodHomePageLink : UITextView!
    let httpClient = HTTPClient()
    var searchList = [SearchModel]()
    var MapList = MapModelList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XY()

    }
    func details(){
        foodRoadAddress.numberOfLines = 2
        foodAddress.numberOfLines = 2
        foodTitle.text = searchList[0].title
        foodCategory.text = searchList[0].category
        foodAddress.text = "주소 : "+searchList[0].address
        foodRoadAddress.text = "도로명주소 : "+searchList[0].roadAddress
        foodHomePageLink.text = searchList[0].homePageLink
        foodHomePageLink.dataDetectorTypes = .link
        foodHomePageLink.isEditable = false
        setMapView(coordinate: change(y: MapList.documents[0].y, x: MapList.documents[0].x), addr: searchList[0].title)
    }
    @IBAction func delteBarButton(_ sender: UIBarButtonItem) {
        httpClient.delete(url: "http://10.156.147.167:8080/api/restaurant/"+String(searchList[0].index),
                          params: nil,
                          header: Header.isEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode{
            case 200 :
                print("성공")
            default :
                print(res.response?.statusCode ?? 0)
            }
        })
        self.navigationController?.popViewController(animated: true)
    }
    
    private func XY(){
        httpClient.get(url:"https://dapi.kakao.com//v2/local/search/address.json",
                       params: ["query" : searchList[0].roadAddress],
                       header: ["Authorization" : "KakaoAK e9ebe7bb5ea8722457e9bdd946155f6c"]
        ).responseData(completionHandler: { [unowned self] response in
            switch response.response?.statusCode {
            case 200:
                do {
                    let Map = try JSONDecoder().decode(MapModelList.self, from: response.data!)
                    MapList.documents.removeAll()
                    MapList.documents.append(contentsOf: Map.documents)
                    details()

                } catch {
                    print(error)
                }
            default:
                print(response.response?.statusCode as Any)
            }
        })
    }
    func change(y : String,x : String) -> CLLocationCoordinate2D{
        let MapXY = CLLocationCoordinate2D(latitude: Double(y) ?? 0, longitude: Double(x) ?? 0)
        return MapXY
    }
    
    func setMapView(coordinate: CLLocationCoordinate2D, addr: String){
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01))
        self.mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = addr
        self.mapView.addAnnotation(annotation)
    }
    
}



//
//  ThirdViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/14.
//

import UIKit
import CoreLocation
import MapKit
class ThirdViewController : UIViewController,CLLocationManagerDelegate,MKMapViewDelegate{
    @IBOutlet var mapView : MKMapView!
    @IBOutlet var foodTitle : UILabel!
    @IBOutlet var foodCategory : UILabel!
    @IBOutlet var foodAddress : UILabel!
    @IBOutlet var foodRoadAddress : UILabel!
    @IBOutlet var foodHomePageLink : UITextView!
    var data : Int = 0
    let httpClient = HTTPClient()
    var searchList = SearchCommunityListModel()
    var MapList = MapModelList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XY()

    }
    @IBAction func addFoodButton(_ sender: UIBarButtonItem) {
        httpClient.post(url:"http://10.156.147.167:8080/api/restaurant",
                        params: ["title" : searchList.searchResult[data].title,
                                 "category" : searchList.searchResult[data].category,
                                 "address" : searchList.searchResult[data].address,
                                 "roadAddress" : searchList.searchResult[data].roadAddress,
                                 "homePageLink" : searchList.searchResult[data].homePageLink,
                                 "imageLink" : searchList.searchResult[data].imageLink],
                       header: Header.isEmpty.header()
        ).responseData(completionHandler: { [unowned self] response in
            switch response.response?.statusCode {
            case 200:
                alertReasult(alearTitle: "성공", alertMessage: "저장 완료!")
                print("성공")
            case 400:
                alertReasult(alearTitle: "오류", alertMessage: "이미 존재함!")
                print("중복됨")
            default:
                print(response.response?.statusCode as Any)
            }
        
        })
    }
    func alertReasult(alearTitle: String,alertMessage: String){
        let alert = UIAlertController(title: alearTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func details(){
        foodRoadAddress.numberOfLines = 2
        foodAddress.numberOfLines = 2
        foodTitle.text = searchList.searchResult[data].title
        foodCategory.text = searchList.searchResult[data].category
        foodAddress.text = "주소 : "+searchList.searchResult[data].address
        foodRoadAddress.text = "도로명주소 : "+searchList.searchResult[data].roadAddress
        foodHomePageLink.text = searchList.searchResult[data].homePageLink
        foodHomePageLink.dataDetectorTypes = .link
        foodHomePageLink.isEditable = false
        setMapView(coordinate: change(y: MapList.documents[0].y, x: MapList.documents[0].x), addr: searchList.searchResult[data].title)
    }
    func XY(){
        httpClient.get(url:"https://dapi.kakao.com//v2/local/search/address.json",
                       params: ["query" : searchList.searchResult[data].roadAddress],
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


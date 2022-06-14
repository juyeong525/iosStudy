import Alamofire
enum Header {
    case isEmpty

    func header() -> HTTPHeaders {
        switch self {
        case .isEmpty:
            return ["Content-Type" : "application/json"]
        }
    }
}

//
//  kakaoMaptest.metal
//  
//
//  Created by 박주영 on 2022/06/16.
//

#include <metal_stdlib>
using namespace metal;
#import <DaumMap/MTMapView.h>
- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _mapView.delegate = self;
    _mapView.baseMapType = MTMapTypeHybrid;
    [self.view addSubview:_mapView];

}


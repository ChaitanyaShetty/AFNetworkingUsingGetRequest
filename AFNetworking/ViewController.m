//
//  ViewController.m
//  AFNetworking
//
//  Created by test on 3/10/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getRequest:@"http://api.wunderground.com/api/b1da5535bc975303/geolookup/conditions/forecast/q/autoip.json"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getRequest :(NSString *)string {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:string parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *json = (NSDictionary *)responseObject;
                                              NSArray *city = [[[json valueForKey:@"current_observation"]valueForKey:@"display_location"] valueForKey:@"city"];
                                              NSLog(@"city:%@", city);
        
                                              NSLog(@"json data %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network not found" message:@"Please connect to the internet " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    
    
    
    //or
    
    
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:string parameters:nil
//                                  success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//                                      NSDictionary *json = (NSDictionary *)responseObject;
//                                      NSArray *city = [[[json valueForKey:@"current_observation"]valueForKey:@"display_location"] valueForKey:@"city"];
//                                      NSLog(@"city:%@", city);
//                                      
//                                      NSLog(@"json data %@", responseObject);
//                                      
//                                  } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//                                      
//                                  }];
    
}

@end

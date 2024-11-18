//
//  ViewController.m
//  weatherapp
//
//  Created by Celestial on 31/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}




- (IBAction)fetchWeather:(id)sender {
//    [self fetchWeatherDataForCity:@"Delhi"];
    // Retrieve the UITextField using its tag
        UITextField *cityTextField = (UITextField *)[self.view viewWithTag:100];
        NSString *city = cityTextField.text;
        
        // Check if the city field is empty
        if (city.length == 0) {
            city = @"Delhi"; // Default city
        }
        
        [self fetchWeatherDataForCity:city];
}


-(void)fetchWeatherDataForCity:(NSString *)city {
    NSString *apiKey = @"251f5184b1d517441d4fad2f14c6b911";
    NSString *urlString = [NSString stringWithFormat:@"https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric", city , apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError.localizedDescription);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateUIWithWeatherData:json];
        });
    }];
    
    [task resume];
}

-(void)updateUIWithWeatherData:(NSDictionary *)data {
    // Extract data from the JSON
    NSString *cityName = data[@"name"];
    NSString *country = data[@"sys"][@"country"];
    NSString *temperature = [NSString stringWithFormat:@"%.1f°C", [data[@"main"][@"temp"] floatValue]];
    NSString *weatherDescription = [data[@"weather"] firstObject][@"description"];
    
    // Additional data fields
    NSString *updatedTime = [self formatDateWithTimestamp:[data[@"dt"] doubleValue]];
    NSString *windSpeed = [NSString stringWithFormat:@"%.1f Km/Hr", [data[@"wind"][@"speed"] floatValue]];
    NSString *humidity = [NSString stringWithFormat:@"%@%%", data[@"main"][@"humidity"]];
    
    // Update UI elements
    self.cityLabel.text = [NSString stringWithFormat:@"City name: %@", cityName];
    self.temperatureLabel.text = [NSString stringWithFormat:@"Country : %@", temperature];
    self.descriptionLabel.text = [NSString stringWithFormat:@"WeatherDescription : %@", [weatherDescription capitalizedString]];
    self.updatedLabel.text = [NSString stringWithFormat:@"Updated: %@", updatedTime];
    self.countryLabel.text = [NSString stringWithFormat:@"Country Name: %@", country];
    self.windLabel.text = [NSString stringWithFormat:@"Wind Speed (Km/hr): %@", windSpeed];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %@", humidity];
    
    // Update weather icon based on description
    [self updateWeatherIconForDescription:weatherDescription];
}

- (void)updateWeatherIconForDescription:(NSString *)description {
    // Choose an icon based on description
    if ([description containsString:@"clear"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"clear"];
    } else if ([description containsString:@"cloud"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"cloud"];
    } else if ([description containsString:@"rain"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"rain"];
    } else if ([description containsString:@"snow"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"snow"];
    } else if ([description containsString:@"storm"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"storm"];
    } else if ([description containsString:@"smoke"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"Smoke"];
    }else if ([description containsString:@"haze"]) {
        self.backgroundImageView.image = [UIImage imageNamed:@"haze"];
    }
    else {
        self.backgroundImageView.image = [UIImage imageNamed:@"default"];
    }
}

// Helper method to format the timestamp to a readable date
-(NSString *)formatDateWithTimestamp:(NSTimeInterval)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    return [formatter stringFromDate:date];
}


@end

//
//  ViewController.h
//  weatherapp
//
//  Created by Celestial on 31/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *updatedLabel;
//@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
//@property (weak, nonatomic) IBOutlet UIButton *fetchWeatherButton;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *fetchWeather;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
- (IBAction)fetchWeather:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end


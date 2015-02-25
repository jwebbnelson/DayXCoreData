//
//  DetailViewController.m
//  DayXStoryboard
//
//  Created by Jordan Nelson on 2/23/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"



static NSString *subjectKey = @"subjectKey"; // Title
static NSString *entryKey = @"entryKey";     // Text
static NSString *journalKey = @"journalKey"; // Entry

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;

@property (nonatomic, strong) Entry *entry;
@end

@implementation DetailViewController

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearAction:(id)sender {
    self.titleTextField.text = @"";
    self.textView.text = @"";
}

- (IBAction)saveAction:(id)sender {
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textView.text;
        self.entry.timestamp = [NSDate date];
        
        [[EntryController sharedInstance]synchronize];
    } else {
        [[EntryController sharedInstance] addEntryWithTitle:self.titleTextField.text Text:self.textView.text andDate:[NSDate date]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - updateWithDictionary Method
-(void)updateWithDictionary:(NSDictionary *)dictionary{
    self.titleTextField.text = dictionary[subjectKey];
    self.textView.text = dictionary[entryKey];
}

-(void)updateWithEntry:(Entry*)entry{
    self.entry = entry;
    self.titleTextField.text = entry.title;
    self.textView.text = entry.text;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *logo = [UIImage imageNamed:@"dayxfinal"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

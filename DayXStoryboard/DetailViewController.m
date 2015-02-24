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
    Entry *entry = [[Entry alloc]initWithDictionary: @{titleKey: self.titleTextField.text, textKey: self.textView.text}];
    
    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];
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

//// Keyboard Removal
//-(BOOL)textFieldShouldReturn:(UITextView *)textView{
//    [textView resignFirstResponder];
//    return YES;
//}
//
//// Keyboard Removal
//-(BOOL)textViewShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}

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

//
//  MainViewController.m
//  PaintBoard
//

#import "MainViewController.h"
#import "PaintView.h"

@interface MainViewController ()

@property (nonatomic, retain) PaintView *paintView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.paintView = [[[PaintView alloc] initWithFrame:self.view.bounds] autorelease];
    [self.view addSubview:self.paintView];
    
    UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    undoButton.frame = CGRectMake(15, 35, 60, 33);
    undoButton.backgroundColor = [UIColor redColor];
    [undoButton setTitle:@"撤销" forState:UIControlStateNormal];
    [undoButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [undoButton addTarget:self.paintView action:@selector(undoOperation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
    UIButton *cleanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanButton.frame = CGRectMake(245, 35, 60, 33);
    [cleanButton setTitle:@"清除" forState:UIControlStateNormal];
    [cleanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cleanButton.backgroundColor = [UIColor greenColor];
    [cleanButton addTarget:self.paintView action:@selector(cleanPaintBoard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cleanButton];
    
    UIButton *smallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    smallButton.frame = CGRectMake(10, 520, 60, 30);
    [smallButton setTitle:@"小画笔" forState:UIControlStateNormal];
    smallButton.tag = 111;

    [smallButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [smallButton addTarget:self action:@selector(handleSmallButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:smallButton];
    
    UIButton *middleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    middleButton.frame = CGRectMake(80, 520, 60, 30);
    [middleButton setTitle:@"中画笔" forState:UIControlStateNormal];
    middleButton.tag = 112;
    [middleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [middleButton addTarget:self action:@selector(handleMiddleButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:middleButton];
    
    UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigButton.frame = CGRectMake(150, 520, 60, 30);
    [bigButton setTitle:@"大画笔" forState:UIControlStateNormal];
    bigButton.tag = 113;
    [bigButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bigButton addTarget:self action:@selector(handleBigButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigButton];
    
    UIButton *randomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    randomButton.frame = CGRectMake(245, 520, 60, 30);
    [randomButton setTitle:@"颜色" forState:UIControlStateNormal];
    [randomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [randomButton addTarget:self action:@selector(handleRandomButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:randomButton];
}

- (void)handleSmallButton:(UIButton *)sender{
    self.paintView.lineWidth = 1;
    sender.backgroundColor = [UIColor redColor];
    [[self.view viewWithTag:112] setBackgroundColor:[UIColor whiteColor]];
    [[self.view viewWithTag:113] setBackgroundColor:[UIColor whiteColor]];
}
- (void)handleMiddleButton:(UIButton *)sender{
    self.paintView.lineWidth = 6;
    sender.backgroundColor = [UIColor redColor];
    [[self.view viewWithTag:111] setBackgroundColor:[UIColor whiteColor]];
    [[self.view viewWithTag:113] setBackgroundColor:[UIColor whiteColor]];
}
- (void)handleBigButton:(UIButton *)sender{
    self.paintView.lineWidth = 12;
    sender.backgroundColor = [UIColor redColor];
    [[self.view viewWithTag:112] setBackgroundColor:[UIColor whiteColor]];
    [[self.view viewWithTag:111] setBackgroundColor:[UIColor whiteColor]];
}
- (void)handleRandomButton:(UIButton *)sender{
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;
    self.paintView.lineColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    [sender setTitleColor:self.paintView.lineColor forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

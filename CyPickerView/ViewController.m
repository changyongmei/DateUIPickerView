//
//  ViewController.m
//  CyPickerView
//
//  Created by 常永梅 on 2020/11/5.
//

#import "ViewController.h"
#import "DateAndTimePickerView.h"

// 屏幕高度
#define SCREENHEIGHT            CGRectGetHeight([UIScreen mainScreen].bounds)
// 屏幕宽度
#define SCREENWIDTH             CGRectGetWidth([UIScreen mainScreen].bounds)

@interface ViewController ()<DateAndTimePickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *pickerCy;
}
@property (nonatomic, strong) UIButton *btntime;

@property (nonatomic, strong) DateAndTimePickerView *timePickerView;
@property (nonatomic, strong) UIView *lightGrayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btntime = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btntime addTarget:self action:@selector(BtnTimeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.btntime setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    self.btntime.titleLabel.font = [UIFont systemFontOfSize:13];
    self.btntime.frame = CGRectMake((SCREENWIDTH-200)/2, 260, 200, 60);
    [self.view addSubview:self.btntime];
    self.btntime.backgroundColor = [UIColor brownColor];

    
    self.lightGrayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:self.lightGrayView];
    self.lightGrayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.lightGrayView.hidden = YES;
    // 单击的 Recognizer(_typeBottomView添加手势)
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lightGrayViewSingleTapFromAction)];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [self.lightGrayView addGestureRecognizer:singleRecognizer];
    
    /*自定义组件*/
    self.timePickerView = [[DateAndTimePickerView alloc] initWithFrame:CGRectMake(52, 144, 269, 464.5) withTimeShowMode:ShowAllTime withIsShowTodayDate:YES];
    self.timePickerView.backgroundColor = [UIColor whiteColor];
    self.timePickerView.delegate = self;
    [self.view addSubview:self.timePickerView];
    self.timePickerView.hidden = YES;
    self.timePickerView.layer.masksToBounds = YES;
    self.timePickerView.layer.cornerRadius = 5;
    
    /**/
//    [self initPickerView];
    
}

#pragma mark -
-(void)initPickerView{
    UIPickerView *pickerCy = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 300, 400, SCREENWIDTH)];
    pickerCy.delegate = self;
    pickerCy.dataSource = self;
    [self.view addSubview:pickerCy];
}
#pragma mark - delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 6;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 48;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return 64 ;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *rowLabel = [[UILabel alloc]init];
    rowLabel.textAlignment = NSTextAlignmentCenter;
    rowLabel.backgroundColor = [UIColor clearColor];
    rowLabel.frame = CGRectMake(0, 0, 39,SCREENWIDTH);
    rowLabel.textAlignment = NSTextAlignmentCenter;
    rowLabel.font = [UIFont systemFontOfSize:17];
    rowLabel.textColor = [UIColor grayColor];
    [rowLabel sizeToFit];

    rowLabel.text = [NSString stringWithFormat:@"%ld",(long)row];
    return rowLabel;
        
}

#pragma mark - click
-(void)BtnTimeAction{
    self.timePickerView.hidden = NO;
    self.lightGrayView.hidden = NO;
}

- (void)lightGrayViewSingleTapFromAction {
    self.timePickerView.hidden = YES;
    self.lightGrayView.hidden = YES;
}


#pragma mark - DatePickerViewDelegate
-(void)DateAndTimePickerView:(NSString *)year withMonth:(NSString *)month withDay:(NSString *)day withHour:(NSString *)hour withMinute:(NSString *)minute withDate:(NSString *)date withTag:(NSInteger)tag{
    if (tag == 1001) {
       [self.btntime setTitle:date forState:UIControlStateNormal];//
    }else{//1002：取消

    }
    [self lightGrayViewSingleTapFromAction];
}

@end

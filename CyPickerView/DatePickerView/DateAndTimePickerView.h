//
//  DateAndTimePickerView.h
//  DateAndTimePicker
//
//  Created by 常永梅 on 2019/12/23.
//  Copyright © 2019 常永梅. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DateAndTimePickerView;
@protocol DateAndTimePickerViewDelegate <NSObject>

- (void)DateAndTimePickerView:(NSString *)year withMonth:(NSString *)month withDay:(NSString *)day withHour:(NSString *)hour withMinute:(NSString *)minute withDate:(NSString *)date withTag:(NSInteger) tag;

@end
typedef NS_ENUM(NSInteger,TimeShowMode){
    /**
     * 只显示今天之前的时间
     */
    ShowTimeBeforeToday = 1,
    /**
     * 显示今天之后的时间
     */
    ShowTimeAfterToday,
    /**
     * 不限制时间
     */
    ShowAllTime,
    
};
@interface DateAndTimePickerView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTimeShowMode:(TimeShowMode)timeMode withIsShowTodayDate:(BOOL)isShowToday;
@property (nonatomic, assign) id<DateAndTimePickerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

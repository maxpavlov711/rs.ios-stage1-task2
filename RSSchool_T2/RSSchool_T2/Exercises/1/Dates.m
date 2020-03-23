#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSString* strDate = [NSString stringWithFormat:@"%@/%@/%@", month, day, year];
    
    NSDateFormatter* form = [[NSDateFormatter alloc] init];
    form.dateFormat = @"MM/dd/yyyy";
    
    NSDate *date = [form dateFromString:strDate];
    
    form.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru"];;
    form.dateFormat = @"dd MMMM, EEEE";
    
    if (date) {
        return [form stringFromDate:date];
    } else {
        return @"Такого дня не существует";
    }
}
@end

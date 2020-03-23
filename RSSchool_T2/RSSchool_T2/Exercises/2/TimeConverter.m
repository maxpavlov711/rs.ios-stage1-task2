#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSArray* array= @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine",
                           @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                           @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four",
                           @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine"];

    int intHours = [hours intValue];
    int intMinutes = [minutes intValue];

    if (intMinutes == 0) {
        NSString* str = [NSString stringWithFormat:@"%@ o' clock", array[intHours]];
        return str;
        
    } else if (intMinutes > 60) {
        return @"";
    
    } else if (intMinutes == 30) {
        return [NSString stringWithFormat:@"half past %@", array[intHours]];
        
    }
    
    NSString* relation = intMinutes < 30 ? @"past" : @"to";
    int delta = intMinutes - 30;
    int iDelta = abs(delta);
    int index = intMinutes < 30 ? 0 : 1;

    if (iDelta == 1) {
        return [NSString stringWithFormat:@"1 minute %@ %@", relation, array[intHours + index]];
        
    }

    if (iDelta == 15) {
        return [NSString stringWithFormat:@"quarter %@ %@", relation, array[intHours + index]];
        
    }

    NSString* string = [NSString stringWithFormat:@"%@ minutes %@ %@", array[iDelta], relation, array[intHours + index]];
    return [NSString stringWithFormat:@"%@ minutes %@ %@", array[30 - iDelta], relation, array[intHours + index]];
    
}

@end

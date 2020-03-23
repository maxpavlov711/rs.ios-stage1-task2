#import "Blocks.h"

@implementation Blocks {

  NSArray* _array;
    BlockC _block;
    
}

- (BlockA) blockA {
    return [^(NSArray *array) {
        _array = [array copy];
    } copy];
}

- (BlockB) blockB {
    return [^(Class class) {
        
        if ([NSString class] == class) {
            NSString *result = @"";
            
            for (NSObject *elem in _array) {
                if ([elem isKindOfClass:class]) {
                    result = [result stringByAppendingString:(NSString *)elem];
                }
            }
            
            _block(result);
        } else if ([NSNumber class] == class) {
            int result = 0;
            
            for (NSObject *elem in _array) {
                if ([elem isKindOfClass:class]) {
                    result += [(NSNumber *)elem intValue];
                }
            }
            
            _block([[NSNumber alloc] initWithInt:result]);
        } else if ([NSDate class] == class) {
           NSTimeInterval result = 0;
            
            for (NSObject *elem in _array) {
                if ([elem isKindOfClass:class]) {
                    NSTimeInterval timeInterval = [(NSDate *)elem timeIntervalSince1970];
                    
                    if (timeInterval > result) {
                        result = timeInterval;
                    };
                }
            }
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970: result];
            NSString *stringDate = [dateFormatter stringFromDate:date];
                            
            _block(stringDate);
        }

    } copy];
}

- (void) setBlockC: (BlockC) block {
    _block = [block copy];
};

@end


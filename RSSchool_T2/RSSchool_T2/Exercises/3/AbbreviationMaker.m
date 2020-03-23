#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSMutableString* mutableA = [a mutableCopy];
    
    for (int i = 0; i < [b length]; i++) {
        NSString* strB = [b substringWithRange: NSMakeRange(i, 1)];
        
        for (int j = i; j < [mutableA length]; j++) {
            NSString* strA = [mutableA substringWithRange: NSMakeRange(j, 1)];
            
            if ([strB isEqualToString: strA]) {
                break;
            }
            
            strA = [strA uppercaseString];
            
            if ([strB isEqualToString: strA]) {
                [mutableA replaceCharactersInRange: NSMakeRange(j, 1) withString: strA];
                break;
            }
            
            [mutableA deleteCharactersInRange:NSMakeRange(j, 1)];
            j--;
        }
    }
    
    if ([mutableA containsString:b]) {
        return @"YES";
    }
    
    return @"NO";
}
@end


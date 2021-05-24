#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
   
    NSMutableString *result = [[NSMutableString alloc] init];
    
    while ((string1.length != 0) && (string2.length != 0))
    if ([string1 characterAtIndex:0] <= [string2 characterAtIndex:0]) {
        NSString *newString = [string1 substringWithRange:NSMakeRange(0, 1)];
        string1 = [string1 substringFromIndex:1];
        result = [result stringByAppendingString:newString];
    } else {
        NSString *newString = [string2 substringWithRange:NSMakeRange(0, 1)];
        string2 = [string2 substringFromIndex:1];
        result = [result stringByAppendingString:newString];
    }
    if ((string1.length == 0) && (string2.length != 0)) {
        result = [result stringByAppendingString:string2];
    } else {
        result = [result stringByAppendingString:string1];
    }
    return  result;
}

@end

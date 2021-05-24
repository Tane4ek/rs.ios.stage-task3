#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if (ratingArray.count < 3) {
        return  0;
    }
    int count = 0;
    
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:ratingArray];
    NSLog(@"new array %@", newArray);
    
    for (int i = 0; (i < (newArray.count - 2)); i++) {
        for (int j = i + 1; (j < (newArray.count - 1)); j++) {
            for (int k = j + 1; (k <newArray.count); k++) {
                    NSNumber *player1 = [newArray objectAtIndex:i];
                    NSNumber *player2 = [newArray objectAtIndex:j];
                    NSNumber *player3 = [newArray objectAtIndex:k];
                    NSLog(@"%@, %@, %@", player1, player2, player3);
                    if (((player1.intValue > player2.intValue) && (player2.intValue > player3.intValue)) || ((player1.intValue < player2.intValue) && (player2.intValue < player3.intValue))) {
                        count += 1;
                    }
            }
        }
    }
    return count;
}

@end

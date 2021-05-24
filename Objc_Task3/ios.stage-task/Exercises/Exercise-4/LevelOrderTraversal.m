#import "LevelOrderTraversal.h"

    void increment(NSMutableArray<NSNumber *> *array, NSInteger index) {
        array[index] = @(array[index].integerValue + 1);
    }

    void addResult(NSMutableArray<NSMutableArray<NSNumber *> *> *array, NSInteger index, NSNumber *value) {
        if (index == array.count)
            [array addObject:[[NSMutableArray alloc] init]];
        [array[index] addObject:value];
    }

    NSArray *LevelOrderTraversalForTree(NSArray *tree) {
        NSMutableArray<NSMutableArray<NSNumber *> *> *result = [[NSMutableArray alloc] init];
        NSMutableArray<NSNumber *> *levels = [[NSMutableArray alloc] init];
        for (NSNumber *it in tree)
        {
            if ([it isKindOfClass:NSNumber.class])
            {
                addResult(result, levels.count, it);
                [levels addObject:[NSNumber numberWithInteger:0]];
            }
            else
            {
                for (;;)
                {
                    if (levels.count == 0)
                        return @[];

                    increment(levels, levels.count - 1);
                    if (levels.lastObject.integerValue == 1)
                        break;

                    [levels removeLastObject];
                    if (levels.count == 0)
                        break;
                }
            }
        }
        return result;
}

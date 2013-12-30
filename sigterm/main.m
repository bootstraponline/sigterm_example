//
//  main.m
//  sigterm
//

#import <Foundation/Foundation.h>

void sigterm(int signal) {
    NSLog(@"Signal %i", signal);
    exit(EXIT_FAILURE);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        signal(SIGTERM, sigterm);
        
        //
        // trigger using: kill 6579
        //
        NSLog(@"pid: %i", [[NSProcessInfo processInfo] processIdentifier]);
        
        while (true) {
            NSLog(@"loop");
            [NSThread sleepForTimeInterval:3.0f];
        }
        
    }
    
    return 0;
}


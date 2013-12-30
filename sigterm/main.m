//
//  main.m
//  sigterm
//

#import <Foundation/Foundation.h>

void processSignal(int signal) {
    NSLog(@"Processed signal %i", signal);
    exit(EXIT_FAILURE);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        signal(SIGTERM, processSignal); // signal 15
        signal(SIGINT, processSignal); // signal 2
        
        //
        // trigger using: kill 6579
        // or ctrl + c (sigint)
        //
        NSLog(@"pid: %i", [[NSProcessInfo processInfo] processIdentifier]);
        
        while (true) {
            NSLog(@"loop");
            [NSThread sleepForTimeInterval:3.0f];
        }
        
    }
    
    return 0;
}


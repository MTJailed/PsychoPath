//
//  ViewController.m
//  amfetamine
//
//  Created by Sem Voigtländer on 19/11/2017.
//  Copyright © 2017 Sem Voigtländer. All rights reserved.
//

#import "ViewController.h"
#import "PrivateAPIManager.h"

#import "xpc.h"
#import "devicesupport.h"
#import "exploit.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <mach/mach.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>

#define die() return;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *exploit;
- (IBAction)doExploit:(id)sender;
@property int retryCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.retryCount = 0;
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    printf("=== PsychoPath Exploit ====\n");
}

- (void) exit_with_failure:(NSString*)reason retry:(bool)retry{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [_exploit setTitle:reason forState:retry ? UIControlStateNormal : UIControlStateDisabled];
        [_exploit setEnabled:retry];
    });
}

- (void) change_exploit_status:(NSString*)status {
    [_exploit setTitle:status forState:UIControlStateDisabled];
}

- (IBAction)doExploit:(id)sender {
    printf("[INFO] Welcome, starting exploit..\n\n");
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [_exploit setEnabled:false];
    });
    [self change_exploit_status:@"Exploiting..."];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString* result = do_exploit();
        if([result isEqualToString:@"Success!"]) {
            
            [self change_exploit_status:result];
        } else {
            [self exit_with_failure:result retry:true];
        }

    });
}
@end

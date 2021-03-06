#import "ManagedObjectEditor-SuperDB.h"

@implementation ManagedObjectEditor (HeroEditor)
+ (id)controllerForHero {
    id ret = [[[self class] alloc] initHeroEditor];
    return [ret autorelease];
}
- (id)initHeroEditor {
    if (self = [super initWithStyle:UITableViewStyleGrouped])
    {
        sectionNames = [[NSArray alloc] initWithObjects:
                        [NSNull null],
                        NSLocalizedString(@"General", @"General"),
                        NSLocalizedString(@"Cameras", @"Powers"),
                        NSLocalizedString(@"Reports", @"Reports"),
                        nil];               
        
        rowLabels = [[NSArray alloc] initWithObjects:
                     
                     // Section 1
                     [NSArray arrayWithObjects:NSLocalizedString(@"Name", @"Name"), nil],
                     
                     // Section 2
                     [NSArray arrayWithObjects:NSLocalizedString(@"Connection", @"Identity"),
                      NSLocalizedString(@"Last Updated", @"Birthdate"),
                      NSLocalizedString(@"Number", @"Age"),
                      NSLocalizedString(@"Type", @"Sex"),
                      NSLocalizedString(@"Device", @"Favorite Color"),
                      nil],
                     
                     // Section 3
                     [NSArray arrayWithObject:@"name"], // label here is the key on the 
                     // to use as the row label
                     
                     // Section 4
                     [NSArray arrayWithObjects:
                      NSLocalizedString(@"Current", @"All Older Heroes"]),
                      NSLocalizedString(@"Status", @"All Younger Heroes"),
                      NSLocalizedString(@"Last Alarm", @"Same Sex Heroes"),
                      NSLocalizedString(@"All Devices", @" Opposite Sex Heroes"), 
                      nil],
                     
                     // Sentinel
                     nil];
        
        rowKeys = [[NSArray alloc] initWithObjects:
                   
                   // Section 1
                   [NSArray arrayWithObjects:@"name", nil],
                   
                   // Section 2
                   [NSArray arrayWithObjects:@"secretIdentity", @"birthdate", @"age",   
                    @"sex", @"favoriteColor", nil],
                   
                   // Section 3
                   [NSArray arrayWithObject:@"powers"],
                   
                   // Section 4
                   [NSArray arrayWithObjects:@"olderHeroes", @"youngerHeroes", 
                    @"sameSexHeroes", @"oppositeSexHeroes", nil],
                   
                   // Sentinel
                   nil];
        
        rowControllers = [[NSArray alloc] initWithObjects:
                          
                          // Section 1
                          [NSArray arrayWithObject:@"ManagedObjectStringEditor"],
                          
                          // Section 2
                          [NSArray arrayWithObjects:@"ManagedObjectStringEditor", 
                           @"ManagedObjectDateEditor",
                           [NSNull null],
                           @"ManagedObjectSingleSelectionListEditor", 
                           @"ManagedObjectColorEditor", 
                           nil],
                          
                          // Section 3
                          [NSArray arrayWithObject:kToManyRelationship],
                          
                          // Section 4
                          [NSArray arrayWithObjects:
                           @"ManagedObjectFetchedPropertyDisplayer", 
                           @"ManagedObjectFetchedPropertyDisplayer", 
                           @"ManagedObjectFetchedPropertyDisplayer", 
                           @"ManagedObjectFetchedPropertyDisplayer", 
                           nil],
                          
                          // Sentinel
                          nil];
        rowArguments = [[NSArray alloc] initWithObjects:
                        
                        // Section 1
                        [NSArray arrayWithObject:[NSNull null]],
                        
                        // Section 2
                        [NSArray arrayWithObjects:[NSNull null], 
                         [NSNull null], 
                         [NSNull null],
                         [NSDictionary dictionaryWithObject:
                          [NSArray arrayWithObjects: @"CMM", @"EDM",@"HMC", @"HOBBER",@"LASER",@"LATHE", @"MILL-TURN", @"ROBOT",@"VMC", @"WATERJET", @"OTHER",nil] 
                                                     forKey:@"list"], 
                         [NSNull null],
                         [NSNull null],
                         nil],
                        
                        // Section 3
                        [NSArray arrayWithObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                                  @"controllerForPower", kSelectorKey, nil]],
                        
                        //Section 4
                        [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"name", @"displayKey", @"controllerForHero", 
                          @"controllerFactoryMethod", nil], 
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"name", @"displayKey", @"controllerForHero", 
                          @"controllerFactoryMethod", nil], 
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"name", @"displayKey", @"controllerForHero", 
                          @"controllerFactoryMethod", nil], 
                         [NSDictionary dictionaryWithObjectsAndKeys:
                          @"name", @"displayKey", @"controllerForHero", 
                          @"controllerFactoryMethod", nil], 
                         nil],
                        
                        // Sentinel
                        nil];    
    }
    return self;
}
@end

@implementation ManagedObjectEditor (PowerEditor)
+ (id)controllerForPower {
    id ret = [[[self class] alloc] initPowerEditor];
    return [ret autorelease]; 
}
- (id)initPowerEditor {
    if (self = [[[self class] alloc] initWithStyle:UITableViewStyleGrouped]) {
        sectionNames = [[NSArray alloc] initWithObjects:[NSNull null], 
                        [NSNull null], nil];               
        rowLabels = [[NSArray alloc] initWithObjects:
                     [NSArray arrayWithObject:NSLocalizedString(@"Name", @"Name")],
                     [NSArray arrayWithObject:NSLocalizedString(@"Source", @"Source")],
                     nil];
        
        rowKeys = [[NSArray alloc] initWithObjects:
                   [NSArray arrayWithObject:@"name"],
                   [NSArray arrayWithObject:@"source"],
                   nil];
        
        rowControllers = [[NSArray alloc] initWithObjects:
                          [NSArray arrayWithObject:@"ManagedObjectStringEditor"],
                          [NSArray arrayWithObject: @"ManagedObjectStringEditor"],
                          nil];
        
        rowArguments = [[NSArray alloc] initWithObjects:
                        [NSArray arrayWithObject:[NSNull null]],
                        [NSArray arrayWithObject:[NSNull null]],
                        nil];    
    }
    return self;
}
@end

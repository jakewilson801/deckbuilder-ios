//
//  MasterViewController.h
//  DeckBuilder
//
//  Created by Jake Wilson on 9/26/14.
//  Copyright (c) 2014 Jake Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end


//
//  Card.h
//  DeckBuilder
//
//  Created by Jake Wilson on 9/26/14.
//  Copyright (c) 2014 Jake Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Card : JSONModel

@property (assign, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* store_url;
@property (strong, nonatomic) NSArray* types;
@property (strong, nonatomic) NSArray* subtypes;
@property (strong, nonatomic) NSArray* colors;
@property (strong, nonatomic) NSArray* cmc;
@property (strong, nonatomic) NSArray* text;
@property (strong, nonatomic) NSArray* power;
@property (strong, nonatomic) NSArray* toughness;



@property (assign, nonatomic) BOOL isInEurope;

@end

/*

 {
 "name": "Saber Ants",
 "id": "saber-ants",
 "url": "https://api.deckbrew.com/mtg/cards/saber-ants",
 "store_url": "http://store.tcgplayer.com/magic/mercadian-masques/saber-ants?partner=DECKBREW",
 "types": [
 "creature"
 ],
 "subtypes": [
 "insect"
 ],
 "colors": [
 "green"
 ],
 "cmc": 4,
 "cost": "{3}{G}",
 "text": "Whenever Saber Ants is dealt damage, you may put that many 1/1 green Insect creature tokens onto the battlefield.",
 "power": "2",
 "toughness": "3",
 "formats": {
 "commander": "legal",
 "legacy": "legal",
 "vintage": "legal"
 },
 "editions": [
 {
 "set": "Mercadian Masques",
 "set_id": "MMQ",
 "rarity": "uncommon",
 "artist": "Greg Staples",
 "multiverse_id": 19862,
 "flavor": "They stay on the battlefield only long enough to consume the losers.",
 "number": "267",
 "layout": "normal",
 "price": {
 "low": 15,
 "median": 28,
 "high": 125
 },
 "url": "https://api.deckbrew.com/mtg/cards?multiverseid=19862",
 "image_url": "https://image.deckbrew.com/mtg/multiverseid/19862.jpg",
 "set_url": "https://api.deckbrew.com/mtg/sets/MMQ",
 "store_url": "http://store.tcgplayer.com/magic/mercadian-masques/saber-ants?partner=DECKBREW"
 }
 ]
 }*/
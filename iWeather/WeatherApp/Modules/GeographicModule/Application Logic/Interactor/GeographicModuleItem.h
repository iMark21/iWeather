//
//  GeographicModuleItem.h
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "GeographicModuleSearchedItem.h"


@protocol AlternativeName
@end

@interface AlternativeName : JSONModel

@property (nonatomic, strong) NSString <Optional> *name;
@property (nonatomic, strong) NSString <Optional> *lang;

@end

@protocol BBox
@end

@interface BBox : JSONModel

@property (nonatomic, strong) NSNumber <Optional> *east;
@property (nonatomic, strong) NSNumber <Optional> *south;
@property (nonatomic, strong) NSNumber <Optional> *north;
@property (nonatomic, strong) NSNumber <Optional> *west;
@property (nonatomic, strong) NSNumber <Optional> *accuracyLevel;

@end

@protocol Timezone
@end

@interface Timezone : JSONModel

@property (nonatomic, strong) NSNumber <Optional> *gmtOffset;
@property (nonatomic, strong) NSString <Optional> *timeZoneId;
@property (nonatomic, strong) NSString <Optional> *dstOffset;

@end

@protocol Geoname
@end

@interface Geoname : JSONModel

@property (nonatomic, strong) Timezone <Optional> *timezone;
@property (nonatomic, strong) BBox <Optional> *bbox;
@property (nonatomic, strong) NSString <Optional> *asciiName;
@property (nonatomic, strong) NSString <Optional> *countryId;
@property (nonatomic, strong) NSString <Optional> *fcl;
@property (nonatomic, strong) NSNumber <Optional> *score;
@property (nonatomic, strong) NSString <Optional> *adminId2;
@property (nonatomic, strong) NSString <Optional> *adminId3;
@property (nonatomic, strong) NSString <Optional> *countryCode;
@property (nonatomic, strong) NSString <Optional> *adminId1;
@property (nonatomic, strong) NSString <Optional> *lat;
@property (nonatomic, strong) NSString <Optional> *fcode;
@property (nonatomic, strong) NSString <Optional> *continentCode;
@property (nonatomic, strong) NSNumber <Optional> *elevation;
@property (nonatomic, strong) NSString <Optional> *adminCode2;
@property (nonatomic, strong) NSString <Optional> *adminCode3;
@property (nonatomic, strong) NSString <Optional> *adminCode1;
@property (nonatomic, strong) NSString <Optional> *lng;
@property (nonatomic, strong) NSNumber <Optional> *geonameId;
@property (nonatomic, strong) NSString <Optional> *toponymName;
@property (nonatomic, strong) NSNumber <Optional> *population;
@property (nonatomic, strong) NSString <Optional> *adminName5;
@property (nonatomic, strong) NSString <Optional> *adminName4;
@property (nonatomic, strong) NSString <Optional> *adminName3;
@property (nonatomic, strong) NSArray <AlternativeName,Optional> *alternateNames;
@property (nonatomic, strong) NSString <Optional> *adminName2;
@property (nonatomic, strong) NSString <Optional> *name;
@property (nonatomic, strong) NSString <Optional> *fclName;
@property (nonatomic, strong) NSString <Optional> *countryName;
@property (nonatomic, strong) NSString <Optional> *fcodeName;
@property (nonatomic, strong) NSString <Optional> *adminName1;

- (void)getGeonameFromGeographicModuleSearchedItem:(GeographicModuleSearchedItem*)geographicModuleSearchedItem;

@end

@protocol GeographicModuleItem
@end

@interface GeographicModuleItem : JSONModel

@property (nonatomic, strong) NSNumber <Optional> *totalResultsCount;
@property (nonatomic, strong) NSArray <Geoname,Optional> *geonames;

@end


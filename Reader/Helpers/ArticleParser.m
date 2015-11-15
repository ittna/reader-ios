//
//  ArticleParser.m
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import "ArticleParser.h"

#import "Article.h"

@interface ArticleParser ()

@property (nonatomic, copy) NSString *currentElementName;
@property (nonatomic, strong) NSMutableDictionary *itemDict;

@property (nonatomic, strong) NSMutableArray *articles;

@end

@implementation ArticleParser {
    SuccessHandler _successHandler;
}

- (instancetype)initWithSuccessHandler:(SuccessHandler)successHandler
{
    if (self = [super init]) {
        _successHandler = successHandler;
    }
    return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.articles = [NSMutableArray array];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    _successHandler(self.articles);
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parse error occurred: %@", parseError);
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    NSLog(@"validation error occurred: %@", validationError);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.currentElementName = elementName;
    
    if ([elementName isEqualToString:@"item"]) {
        self.itemDict = [NSMutableDictionary dictionary];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        NSString *title = self.itemDict[@"title"];
        NSString *description = self.itemDict[@"description"];
        NSString *link = self.itemDict[@"link"];
        NSString *pubDate = self.itemDict[@"pubDate"];
        
        //Mon, 09 Nov 2015 07:58:26 GMT
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEE, dd MM yyyy HH:mm:ss zzz"];
        
        [self.articles addObject:[Article articleWithTitle:title description:description url:[NSURL URLWithString:link] pubDate:[dateFormatter dateFromString:pubDate]]];
        
        self.itemDict = nil;
    }
    
    self.currentElementName = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.currentElementName != nil && self.itemDict != nil) {
        NSString *str = self.itemDict[self.currentElementName];
        str = (str == nil? string: [str stringByAppendingString:string]);
        self.itemDict[self.currentElementName] = str;
    }
}

@end

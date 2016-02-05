//
//  LocalData.m
//  WhatIsTheWord
//
//  Created by Konstantina on 1/29/16.
//  Copyright © 2016 Konstantina. All rights reserved.
//

#import "LocalData.h"

@implementation LocalData

-(instancetype) init{
    
    self = [super init];
    if (self) {
        self.categories = @[@"Object",@"Songs",@"Animals",@"IT"];
        self.wordsObjects =  @[  @"Microphone", @"Piano", @"Umbrella", @"Neck", @"Pillow", @"Saxophone",
        @"Table", @"Chair", @"Glass", @"Straw", @"Wood", @"Water", @"Gas", @"Fork", @"Spoon", @"Plate", @"Stairs", @"Phone", @"Word", @"Game", @"Eye", @"Nose",        @"Glasses", @"Nail", @"Liver", @"Forum", @"Mummy", @"Window", @"Ninja", @"T-shirt", @"Skirt", @"Dress", @"Jeans",@"Lamp", @"Bulb", @"Button",
        @"Curtain", @"Carpet", @"Snow", @"Rain", @"Car", @"Bus", @"Elevator", @"Gloves", @"Scarf", @"Computer", @"Laptop", @"Roof", @"Sofa", @"Coffee",
        @"Traffic light", @"Abs", @"Boy", @"Girl", @"Escalator", @"Brick", @"Fire", @"Flag", @"Bottle", @"Food", @"Door",
        @"Price", @"Drink", @"Song", @"Scene", @"Theatre", @"Cinema", @"Movie", @"Actor", @"Script", @"Projector", @"Bed", @"TV", @"Clothes", @"Drawer", @"Wardrobe",
        @"Washing machine", @"Stove", @"Heater", @"Desk", @"Teddy bear", @"Clock", @"Cable", @"Mirror", @"Toilet", @"Hanger", @"Blackboard",
        @"Pencil", @"Notebook", @"Ear", @"Rubber", @"Eraser", @"Family", @"Folio", @"Forehead", @"Makeup",
        @"Tooth", @"Garden", @"Pool", @"Flower", @"Knife", @"Box", @"Bike", @"Bracelet", @"Ring", @"Necklace", @"Hat", @"Jacket", @"Shoe",
        @"Number", @"Blanket", @"Perfume", @"Shampoo", @"Soap",@"Sink", @"Poster", @"Picture", @"Chat", @"Document", @"Flashlight", @"Money", @"Address", @"House", @"Key", @"Locker"];
        
        self.wordsIt =  @[@"Java", @"Android",@"C#",@"Windows", @"Console", @"Web",@"HTML", @"CSS",
                          @"PHP", @"Python", @"Ruby", @"Bug", @"C++", @"Objective C", @"JavaScript", @"Program", @"StartUp", @"IOS", @"Linux",
                          @"Mac", @"Compilation", @"Database", @"Unit test", @"Integration test", @"MySql", @"SQLite", @"Quality Code", @"MS SQL", @"XAML", @"XML",
                          @"Post", @"Get", @"Put", @"404", @"201", @"501", @"301", @"Install", @"Uninstall", @"CMD", @"Router", @"Firewall", @"Firefox", @"Edge",
                          @"Opera", @"Safari", @"Explorer", @"Chrome", @"Google", @"Video card", @"Ram", @"CPU", @"Motherboard", @"Keyboard", @"USB",
                          @"Touch pad", @"Monitor", @"ROM", @"HDD", @"SDD", @"LAN", @"WWW", @"HTTP", @"HTTPS", @"JSON", @"AJAX", @"Telerik", @"Apple", @"Microsoft", @"Steve Jobs",
                         @"Bill Gates", @"Emulator", @"Virtual Machine", @"HP",@"Promise", @"Query", @"SELECT *", @"Async", @"Integer/int", @"String/string",@"Char/char",
                          @"Boolean/bool", @"Attribute", @"Method", @"Class", @"OOP", @"DSA", @"Function", @"JQuery", @"Angular",
                          @"Fragment", @"Intent", @"Handlebars", @"Server", @"Ping",@"Password", @"Tag", @"Github", @"Hash", @"Queue",
                          @"BigInteger", @"List", @"Stack", @"Exception", @"Debug", @"Build", @"Design Patterns", @"SOLID", @"KISS",@"YAGNI",
                          @"Dependency inversion", @"Boy scout rule", @"Random", @"Tree", @"Graph", @"Algorithm", @"Dijkstra", @"Source control system", @"Binary search",
                          @"Bit", @"Byte", @"Ninject", @"Automapper", @"Reflection", @"Node", @"MVC", @"MVVM", @"Web forms", @".NET", @"Artificial intelligence",
                          @"Code", @"Validation", @"UI", @"Data binding", @"Web site", @"TCP", @"IP", @"Wi-Fi",  @"Photoshop", @"Graphic Design",
                          @"Sublime text", @"Webstorm", @"Jetbrains", @"Visual Studio", @"Atom", @"Digital Signature" ,@"Bitcoin", @".cs",
                          @"CRUD", @".dll", @"Thread", @"goto"];
        self.wordsSongs =  @[@"Eminem - My name is", @"Dr DRE - Still DRE",
                            @"Rolling Stones - Satisfaction", @"Red Hot Chili Peppers - Californication",
                             @"2pac - California Love", @"Eminem - Lose yourself",
                             @"Eminem - Mockingbird", @"Rehanna -rehab", @"Jimi Hendrix - Voodoo child",
                             @"Miley - Can't stop", @"2pac - Changes", @"Justin Timberlake - What goes around comes back around",
                             @"Eminem - When I'm Gone", @"Justin Bieber - Love yourself", @"Mark Lower -  Bad Boys Cry", @"The Weeknd - The Hills",
                             @"Eminem - Superman", @"Justin Bieber - Sorry", @"Years & Years - Take Shelter", @"Years & Years - King",
                             @"Cassie - Me&u", @"Redman - put It Down", @"2pac - How do you want it",
                             @"Three days grace - Pain", @"Cher -Strong Enough",  @"The Weekend - Wicked games",
                             @"Michael Jackson - Billie Jean",@"Matt Pokora - Catch Me If You Can", @"The Doors - Riders of the storm",
                            @"Justin T - My Love", @"Daniel Powter-Bad Day",
                             @"Linkin Park - From the inside", @"Linkin Park - Numb", @"Robbie Williams - Feel",
                             @"Justin Timberlake - Cry Me A River",
                             @"The Pussycat Dolls - I Don't Need A Man", @"Robbie Williams - Something Stupid",
                             @"Robin Schulz - Waves", @"Rob Thomas - Lonely No More"];
    }
    
    return self;
}
@end

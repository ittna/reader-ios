//
//  ArticleCellTableViewCell.h
//  Reader
//
//  Created by Antti Ahvenlampi on 13/11/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

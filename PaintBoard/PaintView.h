//
//  PaintView.h
//  PaintBoard
//


#import <UIKit/UIKit.h>

@interface PaintView : UIView

@property (nonatomic, assign) CGFloat lineWidth;//画线宽度
@property (nonatomic, retain) UIColor *lineColor;//画线的颜色
@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, retain) NSMutableArray *paths;//画线路径数组

//撤销刚画的线
- (void)undoOperation;
//清空画板
- (void)cleanPaintBoard;






@end

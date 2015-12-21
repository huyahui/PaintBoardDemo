//
//  PaintView.m
//  PaintBoard
//


#import "PaintView.h"

@implementation PaintView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置默认值
        self.lineWidth = 5;
        self.lineColor = [UIColor blueColor];
        self.paths = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
        self.colors = [NSMutableArray array];
    }
    return self;
}

#pragma mark - 触摸事件的处理方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //1.获取触摸对象
    UITouch *_touch = [touches anyObject];
    //2.得到触摸的起始点
    CGPoint startPoint = [_touch locationInView:self];
    //3.创建路径对象（使用贝塞尔曲线）
    UIBezierPath *path = [UIBezierPath bezierPath];
    //4.为路径对象添加起始点
    [path moveToPoint:startPoint];
    //5.设置路径的宽度为画线的宽度
    [path setLineWidth:self.lineWidth];
    //6.设置路径样式
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    //7.将路径对象添加到路径数组中
    [self.paths addObject:path];
    //添加当前的画笔颜色对象到颜色数组
    [self.colors addObject:self.lineColor];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //1.获取当前的触摸对象
    UITouch *_touch = [touches anyObject];
    //2.获取当前移动到得点
    CGPoint currentPoint = [_touch locationInView:self];
    //3.获取当前存储这些点得路径对象
    UIBezierPath *currentPath = [self.paths lastObject];
    //4.为路径对象添加新的点，并连成线
    [currentPath addLineToPoint:currentPoint];
    //5.通知当前视图开始重新绘制视图界面
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    NSLog(@"%@", self.colors);
//    //获取当前的上下文(画笔)
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    for (UIColor *color in self.colors) {
//        //设置画笔颜色
//        CGContextSetStrokeColorWithColor(context, color.CGColor);
//    }
//    
//    //重写该方法来实现自定义绘图
//    for (UIBezierPath *path in self.paths) {
//        //为path对象发送strok消息，绘制路径
//        [path stroke];
//    }
    
    
    for (int i = 0; i < self.paths.count; i++) {
        UIColor *currentColor = [self.colors objectAtIndex:i];
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
        UIBezierPath *currentPath = [self.paths objectAtIndex:i];
        [currentPath stroke];
    }
    
}

- (void)undoOperation{
    [self.paths removeLastObject];
    [self.colors removeLastObject];
    //通知视图重新绘制界面
    [self setNeedsDisplay];
}

- (void)cleanPaintBoard{
    [self.paths removeAllObjects];
    [self.colors removeAllObjects];
    [self setNeedsDisplay];//一旦调用该方法就会触发drawRect:方法
}


@end

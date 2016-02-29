/**
 * Created by Administrator on 2016/2/28.
 */
package com.gxuwz.rctrlm.events {
import flash.events.Event;

public class DrawingLineFromExpertEvent extends Event{
//    [Bindable]public var startX:Number;
//    [Bindable]public var startY:Number;
//    [Bindable]public var endX:Number;
//    [Bindable]public var endY:Number;
    [Bindable]public var data:*;
    [Bindable]public var evt:*;
    public static var DRAWING_LINE_FROM_EXPERT:String = "drawingFromExpert";//尝试连接服务
    public static var CLEAN_DRAWING_LINE_FROM_EXPERT:String = "cleanDrawingFromExpert";//尝试连接服务
    public function DrawingLineFromExpertEvent(type:String, bubbles : Boolean = true,
                                               cancelable : Boolean = false) {
        super (type,bubbles,cancelable);
    }
    override public function clone():Event{
        return new DrawingLineFromExpertEvent(type,bubbles,cancelable);
    }
}
}

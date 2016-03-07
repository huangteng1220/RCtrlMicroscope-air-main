/**
 * Created by user on 2015/8/24.
 */
package com.gxuwz.rctrlm.model {
import com.gxuwz.rctrlm.events.*;

import flash.events.EventDispatcher;

import spark.components.Alert;

public class Services {


    //定义几个公共变量。供外部程序访问

    [Bindable] public var _msg:String="";
    [Bindable] public static var localUser:String;

    public function Services() {

    }

    public function onRelay(action:String,user:String):void{
        trace(action+" call from "+user);
        var evt:ConServerBarEvent =new ConServerBarEvent(ConServerBarEvent.PLAY_VIDEO_EVENT);//尝试连连服务
        evt.remoteUser=user;
        evt.action=action;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(evt);

    }

    public function showMsg(fromUser:String,msg:String):void{
        var event:ConServerBarEvent =new ConServerBarEvent(ConServerBarEvent.SHOW_MESSAGE_EVENT);//派发显示信息事件
        event.remoteUser=fromUser;
        event.data=msg;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(event);
    }

    public function onSendCommand(commandStr:String,expertFrom:String):void{
        trace(commandStr+" from"+expertFrom);
        var event:CommandEvent=new CommandEvent(CommandEvent.SEND_COMMAND_FROM_EXPERT);
        event.action=commandStr;
        event.data=expertFrom;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(event);
    }
    //get the disconection information
    public function onDisconnection():void{
        Alert.show("关闭连接");
    }

    public function onEvent(event:String, nameUser:String):void {
//        trace(event+" add to "+nameUser);
        var e:UserAddEvent=new UserAddEvent(UserAddEvent.USER_CONNECTION_WITH_SERVICE_FROM_SERVER);
        e.action=event;
        e.user=nameUser;
        EventDispatcherFactory.getEventDispatcher().dispatchEvent(e);
    }

    // Write message to the text area
    public function onReception(prompt:String, message:String):void {
//        discussion.text += prompt + message + "\n";
    }
    public function onReceptionAction(sx:String,sy:String,ex:String,ey:String,remoteUser:String):void{
        trace(sx+" in Service Class 66");
    }

    public function onDrawingLine(obj:Object,user:String):void{
//        trace(obj.lineStartPoint.x+" in Server from Expert line 74");
//        trace(user+" in Server from Expert line 75 and localuser"+localUser);
        if(localUser==user){
            var e:DrawingLineFromExpertEvent =new DrawingLineFromExpertEvent(DrawingLineFromExpertEvent.DRAWING_LINE_FROM_EXPERT);
            e.data=obj;
            EventDispatcherFactory.getEventDispatcher().dispatchEvent(e);
        }
    }

    public function onCleanUI(user:String):void{
        trace("localUser  "+localUser);
        if(localUser==user){
            var e:DrawingLineFromExpertEvent=new DrawingLineFromExpertEvent(DrawingLineFromExpertEvent.CLEAN_DRAWING_LINE_FROM_EXPERT);
            EventDispatcherFactory.getEventDispatcher().dispatchEvent(e);
        }
    }
}
}

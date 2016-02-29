/**
 * Created by hy2 on 2016/2/26.
 */
package com.gxuwz.rctrlm.events {
import flash.events.Event;

public class StartInitEvent extends Event{
    public function StartInitEvent(type:String, bubbles : Boolean = true,
        cancelable : Boolean = false) {
        super (type,bubbles,cancelable);
    }

    override public function clone():Event{
        return new StartInitEvent(type,bubbles,cancelable);
    }
}
}

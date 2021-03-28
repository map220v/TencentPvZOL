package com.qq.modules.td.logic.mouseAction
{
   import asgui.core.IDisposable;
   import flash.events.MouseEvent;
   
   public interface ITDBaiscMouseAction extends IDisposable
   {
       
      
      function start(param1:Array = null) : void;
      
      function onMouseMove(param1:MouseEvent) : void;
      
      function onMouseClick(param1:MouseEvent) : void;
   }
}

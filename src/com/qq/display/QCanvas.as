package com.qq.display
{
   import asgui.containers.Canvas;
   import asgui.managers.IPopupDragableUI;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class QCanvas extends Canvas implements IPopupDragableUI
   {
       
      
      private var _dragable:Boolean = true;
      
      public function QCanvas(param1:Class = null)
      {
         super();
         var _loc2_:String = getQualifiedClassName(this);
         var _loc3_:Array = _loc2_.split("::");
         this.name = _loc3_[1];
         if(param1 != null)
         {
            RobotlegExtendCmd.registerAndCreateMapView(getDefinitionByName(getQualifiedClassName(this)),param1,this);
         }
      }
      
      public function setX(param1:Number) : void
      {
         super.x = param1;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1);
      }
      
      public function setFullSize() : void
      {
         this.top = 0;
         this.bottom = 0;
         this.left = 0;
         this.right = 0;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         RobotlegExtendCmd.removeMediatorByView(this,this.name);
      }
      
      public function getMediator() : BasicScreenMediator
      {
         return ExtendContext.instance.getMediatorMap().retrieveMediator(this) as BasicScreenMediator;
      }
      
      public function reset(param1:Object = null) : void
      {
         if(this.getMediator() != null)
         {
            this.getMediator().reset(param1);
         }
      }
      
      public function CheckCenterPopUpWhenOutScreen(param1:int, param2:int) : Point
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         return new Point(param1,param2);
      }
      
      public function get dragable() : Boolean
      {
         return this._dragable;
      }
      
      public function set dragable(param1:Boolean) : void
      {
         if(this._dragable != param1)
         {
            this._dragable = param1;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

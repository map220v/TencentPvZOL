package com.qq.display
{
   import asgui.containers.Panel;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class QPanel extends Panel
   {
       
      
      public function QPanel(param1:Class = null)
      {
         super();
         var _loc2_:String = getQualifiedClassName(this);
         var _loc3_:Array = _loc2_.split("::");
         this.name = _loc3_[1];
         if(param1 != null)
         {
            RobotlegExtendCmd.registerMapView(getDefinitionByName(getQualifiedClassName(this)),param1);
            RobotlegExtendCmd.createMediator(this);
         }
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1 * 2 / 2);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1 * 2 / 2);
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
         this.getMediator().reset(param1);
      }
   }
}

package com.qq.modules.td.command.game
{
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDFireBulletCmd
   {
       
      
      public function TDFireBulletCmd()
      {
         super();
      }
      
      public static function shoot(param1:Object, param2:Object, param3:int, param4:String, param5:int = 0, param6:int = 0, param7:int = 1, param8:Boolean = false, param9:Point = null, param10:Array = null, param11:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFireBulletCommand","shoot",[param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11]));
      }
      
      public static function addBullet(param1:Object, param2:int, param3:int, param4:Object, param5:int = 0, param6:int = 0, param7:int = 1, param8:Boolean = false, param9:Point = null, param10:int = 0, param11:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFireBulletCommand","addBullet",[param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11]));
      }
      
      public static function zombieThrowTombBone(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFireBulletCommand","zombieThrowTombBone",[param1]));
      }
      
      public static function zombieThrowItem(param1:int, param2:Point, param3:Point) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFireBulletCommand","zombieThrowItem",[param1,param2,param3]));
      }
   }
}

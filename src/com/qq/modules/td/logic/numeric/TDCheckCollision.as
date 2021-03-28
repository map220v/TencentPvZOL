package com.qq.modules.td.logic.numeric
{
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.geom.Rectangle;
   
   public class TDCheckCollision
   {
      
      private static var _checkRect1:Rectangle;
      
      private static var _checkRect2:Rectangle;
       
      
      public function TDCheckCollision()
      {
         super();
      }
      
      public static function getNewObjRect(param1:IGameObject, param2:Rectangle) : Rectangle
      {
         var _loc3_:Rectangle = new Rectangle();
         _loc3_.x = param1.x + (!!param1.animation ? param1.animation.displayX : 0) + param2.x;
         _loc3_.y = param1.y + (!!param1.animation ? param1.animation.displayY : 0) + param2.y;
         _loc3_.width = param2.width;
         _loc3_.height = param2.height;
         return _loc3_;
      }
      
      private static function checkInit() : void
      {
         if(!_checkRect1)
         {
            _checkRect1 = new Rectangle();
         }
         if(!_checkRect2)
         {
            _checkRect2 = new Rectangle();
         }
      }
      
      private static function changeObjectRect(param1:Rectangle, param2:IGameObject, param3:Rectangle) : Rectangle
      {
         if(!param2.isVaild)
         {
            return param1;
         }
         param1.x = param2.x + param2.animation.displayX + param3.x;
         param1.y = param2.y + param2.animation.displayY + param3.y;
         param1.width = param3.width;
         param1.height = param3.height;
         return param1;
      }
      
      public static function isCollision(param1:IGameObject, param2:Rectangle, param3:IGameObject, param4:Rectangle) : Boolean
      {
         if(!param1.isVaild || !param3.isVaild || param3.animation.display == null)
         {
            return false;
         }
         checkInit();
         _checkRect1 = changeObjectRect(_checkRect1,param1,param2);
         _checkRect2 = changeObjectRect(_checkRect2,param3,param4);
         return _checkRect1.intersects(_checkRect2);
      }
      
      public static function isInCentry(param1:IGameObject, param2:Rectangle, param3:IGameObject, param4:Rectangle) : Boolean
      {
         if(!param1.isVaild || !param3.isVaild || param3.animation.display == null)
         {
            return false;
         }
         checkInit();
         _checkRect1.x = param1.x + param1.animation.displayX + param2.x;
         _checkRect1.y = param1.y + param1.animation.displayY + param2.y;
         _checkRect1.width = param2.width;
         _checkRect1.height = param2.height;
         _checkRect2 = changeObjectRect(_checkRect2,param3,param4);
         return _checkRect1.intersects(_checkRect2);
      }
      
      public static function getHitRect(param1:IGameObject, param2:Rectangle, param3:IGameObject, param4:Rectangle) : Rectangle
      {
         checkInit();
         _checkRect1 = changeObjectRect(_checkRect1,param1,param2);
         _checkRect2 = changeObjectRect(_checkRect2,param3,param4);
         return _checkRect1.intersection(_checkRect2);
      }
      
      public static function isIntersectRect(param1:Rectangle, param2:IGameObject, param3:Rectangle) : Boolean
      {
         checkInit();
         _checkRect1 = changeObjectRect(_checkRect1,param2,param3);
         return param1.intersects(_checkRect1);
      }
      
      public static function isContainPoint(param1:IGameObject, param2:Rectangle, param3:int, param4:int) : Boolean
      {
         checkInit();
         _checkRect1.x = param1.x + param1.animation.displayX + param2.x;
         _checkRect1.y = param1.y + param1.animation.displayY + param2.y;
         _checkRect1.width = param2.width * GameGloble.scaleCurrent;
         _checkRect1.height = param2.height * GameGloble.scaleCurrent;
         return _checkRect1.contains(param3,param4);
      }
      
      public static function isLeft(param1:IGameObject, param2:Rectangle, param3:IGameObject, param4:Rectangle) : Boolean
      {
         if(!param1.isVaild || !param3.isVaild)
         {
            return false;
         }
         return param1.x + param1.animation.displayX + param2.x < param3.x + param3.animation.displayX + param4.x;
      }
   }
}

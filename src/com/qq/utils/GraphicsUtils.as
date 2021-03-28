package com.qq.utils
{
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class GraphicsUtils
   {
       
      
      public function GraphicsUtils()
      {
         super();
      }
      
      public static function drawRect(param1:Object, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int = -1) : void
      {
         var _loc9_:Graphics = null;
         if(param1 is Sprite)
         {
            _loc9_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc9_ = (param1 as Shape).graphics;
         }
         if(_loc9_ == null)
         {
            return;
         }
         if(param7 > 1)
         {
            param7 *= 0.01;
         }
         if(param8 != -1)
         {
            _loc9_.lineStyle(1,param8,1);
         }
         _loc9_.beginFill(param6,param7);
         _loc9_.drawRect(param2,param3,param4,param5);
         _loc9_.endFill();
      }
      
      public static function cleanContainer(param1:Object) : void
      {
         var _loc2_:Graphics = null;
         if(param1 is Sprite)
         {
            _loc2_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc2_ = (param1 as Shape).graphics;
         }
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.clear();
      }
      
      public static function drawCircle(param1:Object, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Graphics = null;
         if(param1 is Sprite)
         {
            _loc7_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc7_ = (param1 as Shape).graphics;
         }
         if(_loc7_ == null)
         {
            return;
         }
         if(param6 > 1)
         {
            param6 *= 0.01;
         }
         _loc7_.beginFill(param5,param6);
         _loc7_.drawCircle(param2,param3,param4);
         _loc7_.endFill();
      }
      
      public static function drawPolygon(param1:Object, param2:Array, param3:Number, param4:Number) : void
      {
         var _loc5_:Graphics = null;
         var _loc7_:Array = null;
         if(param1 is Sprite)
         {
            _loc5_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc5_ = (param1 as Shape).graphics;
         }
         if(_loc5_ == null)
         {
            return;
         }
         if(param4 > 1)
         {
            param4 *= 0.01;
         }
         _loc5_.beginFill(param3,param4);
         var _loc6_:Boolean = true;
         for each(_loc7_ in param2)
         {
            if(_loc6_)
            {
               _loc5_.moveTo(_loc7_[0],_loc7_[1]);
               _loc6_ = false;
            }
            else
            {
               _loc5_.lineTo(_loc7_[0],_loc7_[1]);
            }
         }
         _loc5_.endFill();
      }
      
      public static function drawPolygonLine(param1:Object, param2:Array, param3:Number, param4:Number) : void
      {
         var _loc5_:Graphics = null;
         var _loc7_:Array = null;
         if(param1 is Sprite)
         {
            _loc5_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc5_ = (param1 as Shape).graphics;
         }
         if(_loc5_ == null)
         {
            return;
         }
         if(param4 > 1)
         {
            param4 *= 0.01;
         }
         _loc5_.lineStyle(2,param3,param4,true);
         var _loc6_:Boolean = true;
         for each(_loc7_ in param2)
         {
            if(_loc6_)
            {
               _loc5_.moveTo(_loc7_[0],_loc7_[1]);
               _loc6_ = false;
            }
            else
            {
               _loc5_.lineTo(_loc7_[0],_loc7_[1]);
            }
         }
      }
      
      public static function drawEllipse(param1:Object, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:Number, param8:int = -1, param9:Number = 1, param10:int = -1) : void
      {
         var _loc11_:Graphics = null;
         if(param1 is Sprite)
         {
            _loc11_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc11_ = (param1 as Shape).graphics;
         }
         if(_loc11_ == null)
         {
            return;
         }
         if(param8 == -1)
         {
            param8 = param6;
         }
         if(param10 == -1)
         {
            param10 = 1;
         }
         _loc11_.lineStyle(param10,param8,param9,true);
         _loc11_.beginFill(param6,param7);
         _loc11_.drawEllipse(param2 - param4 * 0.5,param3 - param5 * 0.5,param4,param5);
         _loc11_.endFill();
      }
      
      public static function drawWedge(param1:Object, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         var _loc9_:Graphics = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         if(param1 is Sprite)
         {
            _loc9_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc9_ = (param1 as Shape).graphics;
         }
         if(_loc9_ == null)
         {
            return;
         }
         _loc9_.beginFill(param7,param8);
         _loc9_.lineStyle(0,16711680);
         _loc9_.moveTo(param2,param3);
         param5 = Math.abs(param5) > 360 ? Number(360) : Number(param5);
         var _loc10_:Number = Math.ceil(Math.abs(param5) / 45);
         var _loc11_:Number = (_loc11_ = param5 / _loc10_) * Math.PI / 180;
         param6 = param6 * Math.PI / 180;
         _loc9_.lineTo(param2 + param4 * Math.cos(param6),param3 + param4 * Math.sin(param6));
         var _loc12_:int = 1;
         while(_loc12_ <= _loc10_)
         {
            _loc13_ = (param6 += _loc11_) - _loc11_ / 2;
            _loc14_ = param2 + param4 / Math.cos(_loc11_ / 2) * Math.cos(_loc13_);
            _loc15_ = param3 + param4 / Math.cos(_loc11_ / 2) * Math.sin(_loc13_);
            _loc16_ = param2 + param4 * Math.cos(param6);
            _loc17_ = param3 + param4 * Math.sin(param6);
            _loc9_.curveTo(_loc14_,_loc15_,_loc16_,_loc17_);
            _loc12_++;
         }
         if(param5 != 360)
         {
            _loc9_.lineTo(param2,param3);
         }
         _loc9_.endFill();
      }
      
      public static function drawLine(param1:Object, param2:int, param3:int, param4:int, param5:int, param6:uint) : void
      {
         var _loc7_:Graphics = null;
         if(param1 is Sprite)
         {
            _loc7_ = (param1 as Sprite).graphics;
         }
         else if(param1 is Shape)
         {
            _loc7_ = (param1 as Shape).graphics;
         }
         if(_loc7_ == null)
         {
            return;
         }
         _loc7_.lineStyle(1,param6);
         _loc7_.moveTo(param2,param3);
         _loc7_.lineTo(param4,param5);
      }
   }
}

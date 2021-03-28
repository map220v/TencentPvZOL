package com.gems.utils
{
   import com.gems.GemBase;
   import com.gems.GemWar;
   
   public class GemCreaterUtils
   {
       
      
      public function GemCreaterUtils()
      {
         super();
      }
      
      public static function randomGemBox(param1:int, param2:int, param3:Vector.<GemBase>) : Vector.<GemBase>
      {
         var _loc7_:GemBase = null;
         var _loc4_:Vector.<GemBase> = new Vector.<GemBase>();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < param1 * param2)
         {
            _loc7_ = getRandGem(param3);
            while(randGemReCheck(param1,param2,_loc7_,_loc4_) == false)
            {
               _loc7_ = getRandGem(param3);
            }
            _loc4_.push(_loc7_);
            _loc6_++;
         }
         return _loc4_;
      }
      
      private static function randGemReCheck(param1:int, param2:int, param3:GemBase, param4:Vector.<GemBase>) : Boolean
      {
         var _loc5_:int;
         if((_loc5_ = param4.length) % param1 >= 2)
         {
            if((param4[_loc5_ - 1] as GemBase).type == param3.type && (param4[_loc5_ - 2] as GemBase).type == param3.type)
            {
               return false;
            }
         }
         if(_loc5_ / param1 >= 2)
         {
            if((param4[_loc5_ - param1] as GemBase).type == param3.type && (param4[_loc5_ - param1 * 2] as GemBase).type == param3.type)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function getRandGem(param1:Vector.<GemBase>) : GemBase
      {
         var _loc2_:int = 0;
         var _loc5_:GemBase = null;
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_[_loc2_] = param1[_loc2_];
            _loc3_ += (_loc4_[_loc2_] as GemBase).randomRate;
            _loc2_++;
         }
         _loc4_.sortOn("randomRate",Array.NUMERIC);
         _loc4_.reverse();
         var _loc6_:Number = Math.random() * _loc3_;
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            if(_loc6_ < (_loc4_[_loc2_] as GemBase).randomRate)
            {
               _loc5_ = _loc4_[_loc2_] as GemBase;
               _loc2_ = _loc4_.length;
            }
            else
            {
               _loc6_ -= (_loc4_[_loc2_] as GemBase).randomRate;
            }
            _loc2_++;
         }
         return _loc5_.clone();
      }
      
      public static function getRandGemByRemoveGem(param1:Vector.<GemBase>, param2:Vector.<GemBase>, param3:GemWar) : Vector.<GemBase>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:GemBase = null;
         var _loc10_:GemBase = null;
         var _loc11_:Boolean = false;
         var _loc7_:Array = [];
         var _loc8_:Vector.<GemBase> = new Vector.<GemBase>();
         var _loc9_:int = 0;
         while(_loc9_ < param3.col)
         {
            _loc7_[_loc9_] = 0;
            _loc9_++;
         }
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            if((_loc10_ = param1[_loc5_] as GemBase).idx == 7)
            {
            }
            if(_loc10_.empty != true)
            {
               _loc6_ = GemCreaterUtils.getRandGem(param2) as GemBase;
               _loc11_ = false;
               while(_loc11_ == false)
               {
                  _loc6_.create(_loc10_.idx,_loc7_[_loc10_.idx]);
                  if(canNodeInset(_loc6_.idx,_loc6_.idy,param3))
                  {
                     _loc8_.push(_loc6_);
                     if(_loc6_.idx == 7)
                     {
                     }
                     ++_loc7_[_loc10_.idx];
                     _loc11_ = true;
                  }
                  else
                  {
                     ++_loc7_[_loc10_.idx];
                  }
                  if(_loc7_[_loc10_.idx] == param3.row)
                  {
                     _loc11_ = true;
                  }
               }
            }
            _loc5_++;
         }
         return _loc8_;
      }
      
      private static function canNodeInset(param1:int, param2:int, param3:GemWar) : Boolean
      {
         if(param3.getGemNodeAt(param1,param2).gem != null)
         {
            if(param3.getGemNodeAt(param1,param2).gem.empty == true)
            {
               return false;
            }
         }
         return true;
      }
      
      private function canNodeFallDown() : void
      {
      }
   }
}

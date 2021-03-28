package com.gems.utils
{
   import com.gems.GemBase;
   import com.gems.GemWar;
   import com.gems.vo.GemThawGroupVo;
   import com.gems.vo.GemThawLineVo;
   
   public class GemMathUtils
   {
       
      
      public function GemMathUtils()
      {
         super();
      }
      
      public static function checkGemExchange(param1:GemBase, param2:GemBase, param3:GemWar) : GemThawGroupVo
      {
         if(!param1.isNear(param2))
         {
            return null;
         }
         if(param1.type == param2.type)
         {
            return new GemThawGroupVo();
         }
         var _loc4_:GemThawGroupVo = checkGemThaw(param1,param3);
         var _loc5_:GemThawGroupVo = checkGemThaw(param2,param3);
         return _loc4_.concat(_loc5_);
      }
      
      public static function checkGemThaw(param1:GemBase, param2:GemWar) : GemThawGroupVo
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:GemBase = null;
         var _loc11_:GemThawLineVo = null;
         var _loc5_:int = 0;
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         var _loc10_:GemThawGroupVo = new GemThawGroupVo();
         _loc3_ = param1.idx - 2;
         _loc4_ = param1.idx + 2;
         _loc3_ = _loc3_ < 0 ? 0 : int(_loc3_);
         _loc4_ = _loc4_ >= param2.col ? int(param2.col - 1) : int(_loc4_);
         _loc6_ = [];
         _loc11_ = new GemThawLineVo();
         _loc5_ = _loc3_;
         while(_loc5_ <= _loc4_)
         {
            if((_loc7_ = param2.getGemNodeAt(_loc5_,param1.idy).gem) != null)
            {
               if(_loc7_.type == param1.type)
               {
                  _loc6_.push(_loc7_);
               }
               else
               {
                  if(_loc6_.length >= 3)
                  {
                     _loc8_ = _loc8_.concat(_loc6_);
                     _loc11_.createByGemThawList(_loc6_);
                     _loc10_.addGemThawLine(_loc11_);
                     _loc9_++;
                  }
                  _loc6_ = [];
               }
            }
            _loc5_++;
         }
         if(_loc6_.length >= 3)
         {
            _loc8_ = _loc8_.concat(_loc6_);
            _loc11_.createByGemThawList(_loc6_);
            _loc10_.addGemThawLine(_loc11_);
            _loc9_++;
         }
         _loc3_ = param1.idy - 2;
         _loc4_ = param1.idy + 2;
         _loc3_ = _loc3_ < 0 ? 0 : int(_loc3_);
         _loc4_ = _loc4_ >= param2.row ? int(param2.row - 1) : int(_loc4_);
         _loc6_ = [];
         _loc11_ = new GemThawLineVo();
         _loc5_ = _loc3_;
         while(_loc5_ <= _loc4_)
         {
            if((_loc7_ = param2.getGemNodeAt(param1.idx,_loc5_).gem) != null)
            {
               if(_loc7_.type == param1.type)
               {
                  _loc6_.push(_loc7_);
               }
               else
               {
                  if(_loc6_.length >= 3)
                  {
                     _loc8_ = _loc8_.concat(_loc6_);
                     _loc11_.createByGemThawList(_loc6_);
                     _loc10_.addGemThawLine(_loc11_);
                     _loc9_++;
                  }
                  _loc6_ = [];
               }
            }
            _loc5_++;
         }
         if(_loc6_.length >= 3)
         {
            _loc8_ = _loc8_.concat(_loc6_);
            _loc11_.createByGemThawList(_loc6_);
            _loc10_.addGemThawLine(_loc11_);
            _loc9_++;
         }
         if(_loc9_ != 0)
         {
         }
         if(_loc9_ == 2)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc8_.length)
            {
               if((_loc8_[_loc5_] as GemBase).idx == param1.idx && (_loc8_[_loc5_] as GemBase).idy == param1.idy)
               {
                  _loc8_.splice(_loc5_,1);
                  return _loc10_;
               }
               _loc5_++;
            }
         }
         return _loc10_;
      }
      
      public static function checkGemGroup(param1:Vector.<GemBase>, param2:GemWar) : GemThawGroupVo
      {
         var _loc5_:GemThawGroupVo = null;
         var _loc6_:Vector.<GemBase> = null;
         var _loc7_:int = 0;
         var _loc8_:GemBase = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:GemThawGroupVo = new GemThawGroupVo();
         while(param1.length > 0)
         {
            _loc6_ = (_loc5_ = checkGemThaw(param1.pop(),param2)).gemThawAllVec;
            _loc4_ = _loc4_.concat(_loc5_);
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               _loc8_ = _loc6_[_loc7_] as GemBase;
               _loc10_ = (_loc9_ = param1.length) - 1;
               while(_loc10_ >= 0)
               {
                  if(_loc8_.idx == param1[_loc10_].idx && _loc8_.idy == param1[_loc10_].idy)
                  {
                     param1.splice(_loc10_,1);
                  }
                  _loc10_--;
               }
               _loc7_++;
            }
         }
         return _loc4_;
      }
   }
}

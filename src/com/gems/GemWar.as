package com.gems
{
   import com.gems.utils.GemCreaterUtils;
   import com.gems.utils.GemMathUtils;
   import com.gems.vo.GemThawGroupVo;
   import org.as3commons.logging.api.getLogger;
   
   public class GemWar
   {
       
      
      private var _gemTypeVec:Vector.<GemBase>;
      
      private var _gemNodeArr:Array;
      
      private var _col:int;
      
      private var _row:int;
      
      public function GemWar()
      {
         super();
      }
      
      private function clear() : void
      {
         this._gemNodeArr = [];
      }
      
      public function create(param1:int, param2:int, param3:Vector.<GemBase>, param4:Vector.<GemBase>) : void
      {
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:GemNode = null;
         this.clear();
         this._col = param1;
         this._row = param2;
         this._gemTypeVec = param3;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < this._row)
         {
            _loc7_ = [];
            _loc8_ = 0;
            while(_loc8_ < this._col)
            {
               (_loc9_ = new GemNode(_loc8_,_loc6_)).setGem(param4[_loc5_],true);
               _loc5_++;
               _loc7_[_loc8_] = _loc9_;
               _loc8_++;
            }
            this._gemNodeArr.push(_loc7_);
            _loc6_++;
         }
      }
      
      public function disappearAllGem(param1:IGemEffector, param2:Function) : Vector.<GemBase>
      {
         var _loc5_:int = 0;
         var _loc6_:GemNode = null;
         var _loc3_:Vector.<GemBase> = new Vector.<GemBase>();
         var _loc4_:int = 0;
         while(_loc4_ < this._row)
         {
            _loc5_ = 0;
            while(_loc5_ < this._col)
            {
               if((_loc6_ = this.getGemNodeAt(_loc5_,_loc4_)).gem && _loc6_.gem.empty == false)
               {
                  _loc3_.push(_loc6_.gem);
                  _loc6_.setGem(null);
               }
               _loc5_++;
            }
            _loc4_++;
         }
         param1.playDisappear(_loc3_,param2);
         return _loc3_;
      }
      
      public function gemExchange(param1:GemBase, param2:GemBase, param3:IGemEffector, param4:Function) : GemThawGroupVo
      {
         var _loc5_:GemNode = this.getGemNodeAt(param1.idx,param1.idy);
         var _loc6_:GemNode = this.getGemNodeAt(param2.idx,param2.idy);
         _loc5_.analogCreate(param2);
         _loc6_.analogCreate(param1);
         var _loc7_:GemThawGroupVo = GemMathUtils.checkGemExchange(param1,param2,this);
         _loc5_.analogCreate();
         _loc6_.analogCreate();
         if(_loc7_.length == 0)
         {
            _loc5_.setGem(param1);
            _loc6_.setGem(param2);
            param3.playExchangeFailed(this,param1,param2,param4);
         }
         else
         {
            _loc5_.setGem(param2);
            _loc6_.setGem(param1);
            param3.playExchangeSucceed(this,param1,param2,_loc7_.gemThawAllVec,param4);
         }
         return _loc7_;
      }
      
      public function exchangeAdd(param1:Vector.<GemBase>, param2:Vector.<GemBase>, param3:IGemEffector, param4:Function) : Vector.<GemBase>
      {
         var _loc5_:GemNode = null;
         var _loc6_:GemBase = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:GemNode = null;
         var _loc7_:int = param1.length;
         _loc9_ = 0;
         while(_loc9_ < param1.length)
         {
            (_loc6_ = param1[_loc9_] as GemBase).dispose();
            (_loc5_ = this.getGemNodeAt(_loc6_.idx,_loc6_.idy)).setGem(null);
            _loc9_++;
         }
         var _loc10_:int = 0;
         var _loc11_:Vector.<GemBase> = new Vector.<GemBase>();
         _loc8_ = 0;
         while(_loc8_ < this.col)
         {
            _loc10_ = 0;
            _loc9_ = this.row - 1;
            while(_loc9_ >= 0)
            {
               if((_loc5_ = this.getGemNodeAt(_loc8_,_loc9_)).gem == null)
               {
                  _loc14_ = _loc9_;
                  _loc15_ = this.getGemNodeAt(_loc8_,_loc14_);
                  while(_loc14_ > 0 && (_loc15_.gem == null || _loc15_.gem.empty == true))
                  {
                     _loc14_--;
                     _loc15_ = this.getGemNodeAt(_loc8_,_loc14_);
                  }
                  if(_loc15_.gem != null && _loc15_.gem.empty == false)
                  {
                     _loc5_.setGem(_loc15_.gem);
                     _loc11_.push(_loc15_.gem);
                     _loc15_.setGem(null);
                  }
               }
               _loc9_--;
            }
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < param2.length)
         {
            _loc6_ = param2[_loc8_];
            (_loc5_ = this.getGemNodeAt(_loc6_.idx,_loc6_.idy)).setGem(_loc6_);
            _loc8_++;
         }
         param3.playFallEffect(this,_loc11_,param2,param4);
         var _loc12_:Vector.<GemBase> = new Vector.<GemBase>();
         _loc13_ = 0;
         while(_loc13_ < _loc11_.length)
         {
            _loc12_.push(this.getGemNodeAt(_loc11_[_loc13_].idx,_loc11_[_loc13_].idy).gem);
            _loc13_++;
         }
         _loc13_ = 0;
         while(_loc13_ < param2.length)
         {
            _loc12_.push(this.getGemNodeAt(param2[_loc13_].idx,param2[_loc13_].idy).gem);
            _loc13_++;
         }
         return _loc12_;
      }
      
      public function checkAutoDisappear(param1:Vector.<GemBase>, param2:IGemEffector, param3:Function) : GemThawGroupVo
      {
         var _loc4_:GemThawGroupVo;
         if((_loc4_ = GemMathUtils.checkGemGroup(param1,this)).length > 0)
         {
            param2.playDisappear(_loc4_.gemThawAllVec,param3);
         }
         else
         {
            param3.call();
         }
         return _loc4_;
      }
      
      public function getAddGemByRemoveGem(param1:Vector.<GemBase>) : Vector.<GemBase>
      {
         if(param1.length == 0)
         {
            return new Vector.<GemBase>();
         }
         return GemCreaterUtils.getRandGemByRemoveGem(param1,this._gemTypeVec,this);
      }
      
      public function getGemNodeAt(param1:int, param2:int) : GemNode
      {
         return this._gemNodeArr[param2][param1];
      }
      
      public function getEmptyGemNode() : Vector.<GemNode>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:GemNode = null;
         var _loc1_:Vector.<GemNode> = new Vector.<GemNode>();
         var _loc4_:int = 0;
         while(_loc4_ < this._row)
         {
            _loc5_ = 0;
            while(_loc5_ < this._col)
            {
               if((_loc6_ = this._gemNodeArr[_loc4_][_loc5_] as GemNode).gem && _loc6_.gem.empty)
               {
                  _loc1_.push(_loc6_);
               }
               _loc5_++;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function debugTrace() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:GemNode = null;
         var _loc3_:* = "";
         var _loc4_:int = 0;
         while(_loc4_ < this._row)
         {
            _loc5_ = 0;
            while(_loc5_ < this._col)
            {
               if((_loc6_ = this._gemNodeArr[_loc4_][_loc5_] as GemNode).gem)
               {
                  if(_loc6_.gem.empty)
                  {
                     _loc3_ += "@ ";
                  }
                  else
                  {
                     _loc3_ += "1 ";
                  }
               }
               else
               {
                  _loc3_ += "0 ";
               }
               _loc5_++;
            }
            _loc3_ += "\n";
            _loc4_++;
         }
         getLogger("battle").error(_loc3_);
      }
      
      public function checkPossibleGemList() : void
      {
      }
      
      public function get col() : int
      {
         return this._col;
      }
      
      public function get row() : int
      {
         return this._row;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._gemTypeVec = null;
         if(this._gemNodeArr)
         {
            _loc1_ = this._gemNodeArr.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = (this._gemNodeArr[_loc2_] as Array).length;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  if((this._gemNodeArr[_loc2_][_loc4_] as GemNode).gem)
                  {
                     (this._gemNodeArr[_loc2_][_loc4_] as GemNode).gem.dispose();
                  }
                  _loc4_++;
               }
               _loc2_++;
            }
         }
         this._gemNodeArr = null;
      }
   }
}

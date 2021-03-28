package com.qq.modules.battle.view.control
{
   import asgui.containers.HBox;
   import asgui.controls.Image;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleBuffInfo;
   import com.qq.modules.battle.view.control.unitBuff.BattleBuffFactory;
   import com.qq.modules.battle.view.control.unitBuff.UnitBuff;
   import com.qq.utils.UrlManager;
   
   public class UnitBuffCtr extends BaseUnitControler
   {
       
      
      private var _buffList:Vector.<UnitBuff>;
      
      private var bufIconBox:HBox;
      
      private var bufIconVec:Vector.<Image>;
      
      public function UnitBuffCtr()
      {
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_BUFF;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.bufIconBox)
         {
            this.bufIconBox.Dispose();
         }
      }
      
      override protected function initlize() : void
      {
         this._buffList = new Vector.<UnitBuff>();
         this.bufIconVec = new Vector.<Image>();
         this.bufIconBox = new HBox();
         this.bufIconBox.width = 120;
         this.bufIconBox.height = 30;
         this.bufIconBox.x = 15;
         this.bufIconBox.y = -(_unit.display.height - BattleConst.GRID_HEIGHT) - 25;
         _unitLayer.addChild(this.bufIconBox);
      }
      
      public function addBuff(param1:BattleBuffInfo, param2:uint) : void
      {
         var _loc4_:UnitBuff = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:int = BattleBuffFactory.getOnlyEffect(param1.buffID,param1.buffType);
         if(_loc3_ == -1)
         {
            return;
         }
         if(_loc3_ == BattleBuffFactory.BUFF_EFF_ONLY)
         {
            if(!(_loc4_ = this.getBuffById(param1)))
            {
               _loc4_ = BattleBuffFactory.createBuffById(param1,_unit,param2);
               this._buffList.push(_loc4_);
               this.checkBuffAddIcon(param1);
            }
            else
            {
               _loc4_.addBuffCount();
            }
         }
         else
         {
            _loc4_ = BattleBuffFactory.createBuffById(param1,_unit,param2);
            this._buffList.push(_loc4_);
            this.checkBuffAddIcon(param1);
         }
      }
      
      private function checkBuffAddIcon(param1:BattleBuffInfo) : void
      {
         if(param1.icon != null && param1.icon.length > 0)
         {
            this.addBuffIcon(param1);
         }
      }
      
      public function removeBuff(param1:BattleBuffInfo) : void
      {
         var _loc5_:UnitBuff = null;
         var _loc6_:UnitBuff = null;
         var _loc7_:int = 0;
         var _loc8_:Image = null;
         var _loc9_:String = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Vector.<UnitBuff> = new Vector.<UnitBuff>();
         var _loc3_:int = this._buffList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this._buffList[_loc4_]).buffID == param1.buffID && _loc5_.buffType == param1.buffType)
            {
               _loc5_.reduceBuffCount();
               break;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc6_ = this._buffList[_loc4_]).buffCount > 0)
            {
               _loc2_.push(_loc6_);
            }
            else
            {
               _loc7_ = 0;
               while(_loc7_ < this.bufIconVec.length)
               {
                  _loc8_ = this.bufIconVec[_loc7_];
                  _loc9_ = _loc6_.buffID + "-" + _loc6_.buffType;
                  if(_loc8_.id == _loc9_)
                  {
                     this.bufIconBox.removeChild(_loc8_);
                     _loc8_.Dispose();
                     this.bufIconVec.splice(_loc7_,1);
                     _loc7_--;
                     break;
                  }
                  _loc7_++;
               }
               _loc6_.dispose();
            }
            _loc4_++;
         }
         this._buffList = _loc2_;
      }
      
      public function getBuffById(param1:BattleBuffInfo) : UnitBuff
      {
         var _loc3_:UnitBuff = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._buffList.length)
         {
            _loc3_ = this._buffList[_loc2_];
            if(_loc3_.buffID == param1.buffID && _loc3_.buffType == param1.buffType)
            {
               return this._buffList[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      private function addBuffIcon(param1:BattleBuffInfo) : void
      {
         var _loc2_:String = BattleBuffFactory.getBuffDesc(param1);
         var _loc3_:Image = new Image();
         _loc3_.width = 20;
         _loc3_.height = 26;
         _loc3_.source = UrlManager.getUrl(UrlManager.Url_Battle_UI,param1.icon + ".png");
         _loc3_.id = param1.buffID + "-" + param1.buffType;
         _loc3_.toolTip = _loc2_;
         this.bufIconVec.push(_loc3_);
         this.bufIconBox.addChild(_loc3_);
      }
      
      override public function clear() : void
      {
         var _loc3_:UnitBuff = null;
         super.clear();
         var _loc1_:int = 0;
         while(_loc1_ < this._buffList.length)
         {
            _loc3_ = this._buffList[_loc1_];
            _loc3_.dispose();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.bufIconVec.length)
         {
            this.bufIconBox.removeChild(this.bufIconVec[_loc2_]);
            this.bufIconVec[_loc2_].Dispose();
            _loc2_++;
         }
         this.bufIconVec.length = 0;
      }
   }
}

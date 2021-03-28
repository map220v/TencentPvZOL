package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.templates.font.FontHKHB;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigZombieMoveArea extends TrigPvz
   {
       
      
      private var beginRow:int;
      
      private var endRow:int;
      
      private var beginCol:int;
      
      private var endCol:int;
      
      private var effectUnitList:Array;
      
      private var _checkPosX:int;
      
      public function TrigZombieMoveArea()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc3_:IGameObject = null;
         this.beginRow = triggerParams[0];
         this.endRow = triggerParams[1];
         this.beginCol = triggerParams[2];
         this.endCol = triggerParams[3];
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(this.endCol,1);
         this._checkPosX = _loc1_.rect.x + _loc1_.rect.width;
         this._triggerType = [TDTrigConst.TYPE_ZOMBIE_MOVE];
         this.ui.txt.text = FontHKHB.DOING;
         getLogger("trigger").debug("TrigZombieMoveArea: " + this.beginRow + "  ,  " + this.endRow + "  ,  " + this.beginCol + "  ,  " + this.endCol);
         this.effectUnitList = [];
         var _loc2_:int = this.beginRow;
         while(_loc2_ <= this.endRow)
         {
            _loc3_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,4700);
            this.effectUnitList.push(_loc3_);
            TDGameObjectCmd.addNormalGameObjectByColRow(_loc3_,this.endCol,_loc2_);
            _loc3_.setAction(TDConstant.Achieve_idle);
            _loc2_++;
         }
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         var _loc3_:IGameObject = param2[0];
         if(_loc3_.objectModel.unitType == TDConstant.ZombieType_Parrot)
         {
            return;
         }
         if(_loc3_ && _loc3_.isVaild && _loc3_.objectModel.curHp.get() > 0 && _loc3_.x < this._checkPosX)
         {
            this.setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         if(result == -1)
         {
            this.setResult(false);
            return false;
         }
         this.setResult(true);
         return true;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         var _loc3_:IGameObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.effectUnitList.length)
         {
            _loc3_ = this.effectUnitList[_loc2_];
            if(param1)
            {
               _loc3_.setAction(TDConstant.Achieve_result,[1]);
            }
            else
            {
               _loc3_.setAction(TDConstant.Achieve_result,[0]);
            }
            _loc2_++;
         }
         this.effectUnitList = [];
         super.setResult(param1);
      }
   }
}

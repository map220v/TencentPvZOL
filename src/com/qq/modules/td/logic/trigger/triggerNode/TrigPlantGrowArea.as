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
   
   public class TrigPlantGrowArea extends TrigPvz
   {
       
      
      private var beginRow:int;
      
      private var endRow:int;
      
      private var beginCol:int;
      
      private var endCol:int;
      
      private var effectUnitList:Array;
      
      public function TrigPlantGrowArea()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc2_:int = 0;
         var _loc3_:IGameObject = null;
         var _loc4_:TDMapTileData = null;
         this.beginRow = triggerParams[0];
         this.endRow = triggerParams[1];
         this.beginCol = triggerParams[2];
         this.endCol = triggerParams[3];
         _triggerType = [TDTrigConst.TYPE_PLANT_GROW,TDTrigConst.TYPE_PLANT_MOVE];
         getLogger("trigger").debug("TrigPlantGrowArea: " + this.beginRow + "  ,  " + this.endRow + "  ,  " + this.beginCol + "  ,  " + this.endCol);
         this.ui.txt.text = FontHKHB.DOING;
         this.effectUnitList = [];
         var _loc1_:int = this.beginCol;
         while(_loc1_ <= this.endCol)
         {
            _loc2_ = this.beginRow;
            while(_loc2_ <= this.endRow)
            {
               _loc3_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,4800);
               this.effectUnitList.push(_loc3_);
               TDGameObjectCmd.addNormalGameObjectByColRow(_loc3_,_loc1_,_loc2_);
               (_loc4_ = TDGameInfo.getInstance().getRoadTileInf(_loc1_,_loc2_)).setState(TDConstant.RoadTileState_MILDEW);
               _loc3_.setAction(TDConstant.Achieve_idle);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         var _loc3_:IGameObject = param2[0];
         var _loc4_:TDMapTileData;
         if((_loc4_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc3_.objectModel.tileIndex)).roadRow >= this.beginRow && _loc4_.roadRow <= this.endRow)
         {
            if(_loc4_.roadCol >= this.beginCol && _loc4_.roadCol <= this.endCol)
            {
               this.setResult(false);
            }
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

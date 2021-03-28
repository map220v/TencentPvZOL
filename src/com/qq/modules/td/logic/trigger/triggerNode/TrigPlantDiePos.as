package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.templates.font.FontHKHB;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigPlantDiePos extends TrigPvz
   {
       
      
      private var limitPos:Array;
      
      public function TrigPlantDiePos()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:String = null;
         _loc1_ = "";
         this.limitPos = [];
         var _loc2_:int = triggerParams.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.limitPos[_loc3_] = (triggerParams[_loc3_] as String).split(",");
            _loc1_ += "[" + this.limitPos[_loc3_][0] + this.limitPos[_loc3_][1] + "]";
            _loc3_++;
         }
         _triggerType = [TDTrigConst.TYPE_PLANT_DIE];
         this.ui.txt.text = FontHKHB.DOING;
         getLogger("trigger").debug("TrigPlantDiePos: " + _loc1_);
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         var _loc3_:IGameObject = param2[0];
         var _loc4_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_loc3_.objectModel.tileIndex);
         var _loc5_:int = triggerParams.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_.roadCol == this.limitPos[_loc6_][0] && _loc4_.roadRow == this.limitPos[_loc6_][1])
            {
               this.setResult(false);
               return;
            }
            _loc6_++;
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
         super.setResult(param1);
      }
   }
}

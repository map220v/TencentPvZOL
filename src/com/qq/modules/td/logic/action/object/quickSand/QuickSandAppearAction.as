package com.qq.modules.td.logic.action.object.quickSand
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class QuickSandAppearAction extends BasicAction
   {
       
      
      public function QuickSandAppearAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:TDMapTileData = null;
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onPlayComplete);
         _gameObject.animation.gotoAndPlay("appear",1);
         var _loc2_:Array = new Array();
         var _loc3_:int = 4;
         var _loc4_:int = _gameObject.objectModel.roadIndex - 1;
         while(_loc4_ <= _gameObject.objectModel.roadIndex + 1)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc6_ = _loc4_;
               _loc7_ = _loc5_;
               if((_loc8_ = TDGameInfo.getInstance().getRoadTileInf(_loc7_,_loc6_)) != null)
               {
                  _loc2_.push(_loc8_.index);
               }
               _loc5_++;
            }
            _loc4_++;
         }
         _gameObject.setRunningProp(TDConstant.Gameobject_Prop_QuickSandForbidTile,_loc2_);
         this.setPlantForbid(true);
      }
      
      private function onPlayComplete(param1:Event) : void
      {
         _gameObject.setAction(TDConstant.QuickSandRunningAction);
      }
      
      override public function dispose() : void
      {
         this.setPlantForbid(false);
         super.dispose();
      }
      
      private function setPlantForbid(param1:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:TDMapTileData = null;
         var _loc2_:Array = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_QuickSandForbidTile);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            if((_loc6_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc5_)) != null)
            {
               if(param1)
               {
                  _loc6_.setState(TDConstant.RoadTileState_forbidCropPlant_Temporary);
               }
               else
               {
                  _loc6_.cleanState(TDConstant.RoadTileState_forbidCropPlant_Temporary);
               }
            }
            _loc4_++;
         }
      }
   }
}

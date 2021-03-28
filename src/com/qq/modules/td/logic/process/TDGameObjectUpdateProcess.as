package com.qq.modules.td.logic.process
{
   import asgui.utils.WorldClock;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.UtilsManager;
   import flash.utils.Dictionary;
   
   public class TDGameObjectUpdateProcess extends TDBasicProcess implements IProcess
   {
      
      public static const ID:int = 0;
       
      
      public function TDGameObjectUpdateProcess()
      {
         super();
         updateDuration = int(1000 / 60);
         WorldClock.clock.enabled = true;
      }
      
      override public function doProcess() : void
      {
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         super.doProcess();
         var _loc1_:Dictionary = TDGameInfo.getInstance().gameobjectMap;
         var _loc2_:int = 0;
         for each(_loc3_ in _loc1_)
         {
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.isUpdate)
               {
                  _loc4_.update();
               }
            }
            _loc2_++;
         }
         if(TDGameInfo.getInstance().isDepthChange)
         {
            this.sortDepth();
            TDGameInfo.getInstance().isDepthChange = false;
         }
         WorldClock.clock.advanceTime(-1);
      }
      
      private function sortDepth() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().sortList;
         _loc1_.sort(this.sortLayer);
         for each(_loc2_ in _loc1_)
         {
            UtilsManager.bringToTop(_loc2_.frontLayer);
         }
      }
      
      private function sortLayer(param1:IGameObject, param2:IGameObject) : Number
      {
         var _loc3_:int = 0;
         if(param1.objectModel.isFlying == param2.objectModel.isFlying)
         {
            _loc3_ = param1.y - param2.y;
            if(_loc3_ > 20 || _loc3_ < -20)
            {
               return _loc3_;
            }
            if(param1.objectModel.sortIndex != param2.objectModel.sortIndex)
            {
               return param1.objectModel.sortIndex - param2.objectModel.sortIndex;
            }
            if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Plant && param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Plant)
            {
               return param2.x - param1.x;
            }
            return 0;
         }
         return !!param1.objectModel.isFlying ? Number(1) : Number(-1);
      }
      
      override public function dispose() : void
      {
         WorldClock.clock.enabled = false;
         super.dispose();
      }
   }
}

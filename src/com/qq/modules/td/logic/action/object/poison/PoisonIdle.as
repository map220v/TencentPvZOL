package com.qq.modules.td.logic.action.object.poison
{
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.buff.TDBuffStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.db.ClientDBTableName;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class PoisonIdle extends BasicAction
   {
       
      
      private var m_interval:int;
      
      public function PoisonIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PoisonAction_Idle,true);
         var _loc2_:TDBuffStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDBuffInfo,TDConstant.TDBuffID_Poisoned,TDBuffStaticInfo);
         if(_loc2_)
         {
            this.m_interval = setTimeout(this.removeTileBuff,_loc2_.duration.get());
         }
      }
      
      private function removeTileBuff() : void
      {
         var _loc1_:int = 0;
         var _loc2_:TDMapTileData = null;
         clearTimeout(this.m_interval);
         if(_gameObject)
         {
            _loc1_ = _gameObject.objectModel.tileIndex;
            _loc2_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc1_);
            if(_loc2_)
            {
               _loc2_.cleanState(TDConstant.RoadTileState_Poison);
            }
            _gameObject.Dispose();
            _gameObject = null;
         }
      }
      
      override public function dispose() : void
      {
         clearTimeout(this.m_interval);
         super.dispose();
      }
   }
}

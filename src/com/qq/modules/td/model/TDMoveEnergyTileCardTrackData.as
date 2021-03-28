package com.qq.modules.td.model
{
   import com.qq.modules.td.model.vo.TDMoveEnergyTileCardVO;
   
   public class TDMoveEnergyTileCardTrackData
   {
      
      private static var _instance:TDMoveEnergyTileCardTrackData;
       
      
      private var tileList:Array;
      
      public function TDMoveEnergyTileCardTrackData()
      {
         super();
      }
      
      public static function get instance() : TDMoveEnergyTileCardTrackData
      {
         if(_instance == null)
         {
            _instance = new TDMoveEnergyTileCardTrackData();
         }
         return _instance;
      }
      
      private function initData() : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:XMLList = null;
         var _loc4_:uint = 0;
         var _loc5_:XML = null;
         var _loc6_:TDMoveEnergyTileCardVO = null;
         this.tileList = [];
         var _loc1_:XML = TDStageInfo.getInstance().stageParamXml;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.tileCard;
            if(_loc2_ && _loc2_.length() > 0)
            {
               _loc3_ = _loc2_[0].tile;
               _loc4_ = TDGameInfo.getInstance().getCurGameTime();
               for each(_loc5_ in _loc3_)
               {
                  _loc6_ = new TDMoveEnergyTileCardVO();
                  _loc4_ += uint(_loc5_.@delay);
                  _loc6_.appearTime = _loc4_;
                  _loc6_.type = uint(_loc5_.@type);
                  _loc6_.appeared = false;
                  this.tileList.push(_loc6_);
               }
            }
         }
      }
      
      public function resetData() : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         var _loc4_:XMLList = null;
         var _loc5_:uint = 0;
         var _loc6_:XML = null;
         var _loc7_:TDMoveEnergyTileCardVO = null;
         this.initData();
         var _loc1_:XML = TDStageInfo.getInstance().stageParamXml;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.tileCard;
            _loc3_ = 0;
            if(this.tileList != null && this.tileList.length > 0 && _loc2_ && _loc2_.length() > 0)
            {
               _loc4_ = _loc2_[0].tile;
               _loc5_ = TDGameInfo.getInstance().getCurGameTime();
               for each(_loc6_ in _loc4_)
               {
                  _loc7_ = this.tileList[_loc3_];
                  _loc5_ += uint(_loc6_.@delay);
                  _loc7_.appearTime = _loc5_;
                  _loc7_.appeared = false;
                  _loc3_++;
               }
            }
         }
      }
      
      public function findIncomingTile(param1:uint) : TDMoveEnergyTileCardVO
      {
         var _loc2_:TDMoveEnergyTileCardVO = null;
         for each(_loc2_ in this.tileList)
         {
            if(!_loc2_.appeared && _loc2_.appearTime < param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

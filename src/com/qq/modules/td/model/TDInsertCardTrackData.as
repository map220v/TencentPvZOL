package com.qq.modules.td.model
{
   import com.qq.modules.td.model.vo.TDInsertCardVO;
   
   public class TDInsertCardTrackData
   {
      
      private static var _instance:TDInsertCardTrackData;
       
      
      private var insertList:Array;
      
      public function TDInsertCardTrackData()
      {
         super();
      }
      
      public static function get instance() : TDInsertCardTrackData
      {
         if(_instance == null)
         {
            _instance = new TDInsertCardTrackData();
            _instance.resetData();
         }
         return _instance;
      }
      
      public function resetData() : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         var _loc4_:XMLList = null;
         var _loc5_:uint = 0;
         var _loc6_:XML = null;
         var _loc7_:TDInsertCardVO = null;
         this.insertList = [];
         var _loc1_:XML = TDStageInfo.getInstance().stageParamXml;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.insertCard;
            _loc3_ = 0;
            if(this.insertList != null && _loc2_ && _loc2_.length() > 0)
            {
               _loc4_ = _loc2_[0].card;
               _loc5_ = TDGameInfo.getInstance().getCurGameTime();
               for each(_loc6_ in _loc4_)
               {
                  _loc7_ = new TDInsertCardVO();
                  _loc5_ += uint(_loc6_.@delay);
                  _loc7_.appearTime = _loc5_;
                  _loc7_.appeared = false;
                  _loc7_.id = uint(_loc6_.@id);
                  this.insertList.push(_loc7_);
                  _loc3_++;
               }
            }
         }
      }
      
      public function findIncomingCard(param1:uint) : TDInsertCardVO
      {
         var _loc2_:TDInsertCardVO = null;
         for each(_loc2_ in this.insertList)
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

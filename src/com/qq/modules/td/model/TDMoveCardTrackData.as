package com.qq.modules.td.model
{
   import com.qq.utils.DMath;
   
   public class TDMoveCardTrackData
   {
      
      private static var _instance:TDMoveCardTrackData;
       
      
      private var _ramdomCardList:Array;
      
      private var _seedList:Array;
      
      private var _randomTime:int;
      
      private var _currentTrackCardNum:int;
      
      public function TDMoveCardTrackData()
      {
         super();
         this._randomTime = 10000;
      }
      
      public static function getInstance() : TDMoveCardTrackData
      {
         if(_instance == null)
         {
            _instance = new TDMoveCardTrackData();
         }
         return _instance;
      }
      
      public function get randomTime() : int
      {
         return this._randomTime;
      }
      
      public function get currentTrackCardNum() : int
      {
         return this._currentTrackCardNum;
      }
      
      public function changeCardNum(param1:int) : void
      {
         this._currentTrackCardNum += param1;
      }
      
      public function reset() : void
      {
         var _loc1_:XMLList = null;
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this._ramdomCardList = new Array();
         this._seedList = new Array();
         if(TDStageInfo.getInstance().stageParamXml != null)
         {
            _loc1_ = TDStageInfo.getInstance().stageParamXml.randomCard[0].plant;
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = _loc2_.@id;
               _loc4_ = _loc2_.@p;
               this._ramdomCardList.push(_loc3_);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  this._seedList.push(_loc3_);
                  _loc5_++;
               }
            }
            this._randomTime = int(TDStageInfo.getInstance().stageParamXml.randomTime.@value);
         }
         this._currentTrackCardNum = 0;
      }
      
      public function getRandomPlant() : int
      {
         if(this._seedList.length == 0)
         {
            return 0;
         }
         var _loc1_:int = DMath.randNum(0,this._seedList.length - 1);
         return this._seedList[_loc1_];
      }
      
      public function getPlantMax(param1:int) : int
      {
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc2_:int = int.MAX_VALUE;
         if(TDStageInfo.getInstance().stageParamXml != null)
         {
            _loc3_ = TDStageInfo.getInstance().stageParamXml.randomCard[0].plant;
            for each(_loc4_ in _loc3_)
            {
               if((_loc5_ = _loc4_.@id) == param1)
               {
                  if(int(_loc4_.@max) > 0)
                  {
                     _loc2_ = int(_loc4_.@max);
                     break;
                  }
               }
            }
         }
         return _loc2_;
      }
   }
}

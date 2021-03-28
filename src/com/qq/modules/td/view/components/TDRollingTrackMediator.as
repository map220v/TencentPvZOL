package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class TDRollingTrackMediator extends BasicScreenMediator
   {
      
      private static const RollingData_Total:String = "RollingData_Total";
      
      private static const RollingData_Weights:String = "RollingData_Weights";
      
      private static const RollingData_PlantID:String = "RollingData_PlantID";
      
      private static const RollingData_LastAddTime:String = "RollingData_LastAddTime";
      
      private static const RollingData_Interval:String = "RollingData_Interval";
      
      public static const MAX_CARD_ON_TRACK:int = 9;
       
      
      [Inject]
      public var view:TDRollingTrack;
      
      private var _rollingList:Array;
      
      private var _counter:int;
      
      private var _listLen:int;
      
      private var _curAddCardData:Array;
      
      private var _lastAddCardTime:Number;
      
      private var _lastTime:Number;
      
      public function TDRollingTrackMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.x = 128 + 250;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_StartTDGame,this.onStartTDGame);
         addViewListener(Event.ENTER_FRAME,this.onUpdate);
      }
      
      private function onStartTDGame(param1:Event) : void
      {
         this.initRollingList();
         this._counter = 0;
         this._listLen = this._rollingList.length;
         this._curAddCardData = null;
         this._lastAddCardTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      private function onUpdate(param1:Event) : void
      {
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            return;
         }
         var _loc2_:int = TDGameInfo.getInstance().getCurGameTime();
         this.view.advanceTime(_loc2_ - this._lastTime);
         this._lastTime = _loc2_;
         if(this.view.cMain.numChildren >= MAX_CARD_ON_TRACK)
         {
            return;
         }
         if(this._counter >= this._listLen)
         {
            this._counter = 0;
         }
         if(this._curAddCardData == null)
         {
            this._curAddCardData = this._rollingList[this._counter];
         }
         if(_loc2_ - this._lastAddCardTime > this._curAddCardData[0])
         {
            this._lastAddCardTime = _loc2_;
            ++this._counter;
            this.view.addCard(new TDCardData(GameGloble.actorModel.getUnlockPlant(this._curAddCardData[1]),null));
            this._curAddCardData = null;
         }
      }
      
      private function initRollingList() : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc1_:int = TDStageInfo.getInstance().getMiniGameParamNumber("minDuration");
         var _loc2_:int = TDStageInfo.getInstance().getMiniGameParamNumber("maxDuration");
         var _loc3_:Array = new Array();
         var _loc4_:Array = TDStageInfo.getInstance().getMiniGameParamArray("rollingData");
         for each(_loc5_ in _loc4_)
         {
            if((_loc9_ = _loc5_.split(":"))[1] != 0)
            {
               (_loc10_ = new Array())[RollingData_Total] = _loc9_[0];
               _loc10_[RollingData_Weights] = _loc10_[RollingData_Interval] = int(_loc9_[1] / _loc9_[0]);
               _loc10_[RollingData_PlantID] = _loc9_[2];
               _loc10_[RollingData_LastAddTime] = 0;
               _loc3_.push(_loc10_);
            }
         }
         this._rollingList = new Array();
         _loc6_ = 0;
         _loc7_ = 0;
         _loc8_ = 0;
         while(_loc3_.length > 0)
         {
            _loc6_++;
            if(_loc6_ > 3600)
            {
               break;
            }
            _loc11_ = DMath.randNum(_loc1_,_loc2_);
            _loc7_ += _loc11_;
            _loc8_ += _loc11_;
            _loc12_ = new Array();
            for each(_loc13_ in _loc3_)
            {
               if((_loc15_ = _loc7_ - _loc13_[RollingData_LastAddTime]) >= _loc13_[RollingData_Interval])
               {
                  _loc12_.push(_loc13_);
               }
            }
            if(_loc12_.length != 0)
            {
               _loc12_.sortOn("RollingData_Weights",Array.NUMERIC | Array.DESCENDING);
               if((_loc14_ = _loc12_.pop()) != null)
               {
                  --_loc14_[RollingData_Total];
                  _loc14_[RollingData_LastAddTime] = _loc7_;
                  _loc14_[RollingData_Weights] += 5000;
                  if(_loc14_[RollingData_Total] <= 0)
                  {
                     if((_loc16_ = _loc3_.indexOf(_loc14_)) != -1)
                     {
                        _loc3_.splice(_loc16_,1);
                     }
                  }
                  this._rollingList.push([_loc8_,_loc14_[RollingData_PlantID]]);
                  _loc8_ = 0;
               }
            }
         }
      }
   }
}

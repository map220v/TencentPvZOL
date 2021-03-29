package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.main.logic.initData.basic.IInitDataTask;
   import com.qq.utils.GameDataReport;

import flash.debugger.enterDebugger;
import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class InitDataManager
   {
      
      public static const Init_ClientDB:int = 1;
      
      public static const Init_PlayerInfo:int = 2;
      
      public static const Init_PlayerCard:int = 3;
      
      public static const Init_PlayerGuideInfo:int = 4;
      
      public static const Init_BagItemInfo:int = 5;
      
      public static const Init_QuestInfo:int = 6;
      
      public static const Init_CityInfo:int = 7;
      
      public static const Init_FlagInfo:int = 8;
      
      public static const Init_LabInfo:int = 9;
      
      public static const Init_UnionInfo:int = 10;
      
      public static const Init_MapInfo:int = 11;
      
      public static const Init_BuffInfo:int = 12;
      
      public static const Init_ChatInfo:int = 13;
      
      public static const Init_Activity:int = 14;
      
      public static const Init_OnlineReward:int = 15;
      
      public static const Init_ShortcutPay:int = 16;
      
      public static const Init_Privilege:int = 17;
      
      public static const Init_Fuben:int = 18;
      
      public static const Init_QZoneShare:int = 19;
      
      public static const Init_LevelReward:int = 20;
      
      public static const InitLogicOpenTask:int = 21;
      
      public static const Init_SecondaryPassword:int = 22;
      
      public static const Init_RookieCeremony:int = 23;
      
      public static const Init_Font:int = 24;
      
      public static const Init_MergeServer:int = 25;
      
      public static const Init_Talent:int = 26;
      
      public static const Init_Dummy:int = 27;
      
      private static var _instance:InitDataManager;
       
      
      private var _loadqueue:Array;
      
      private var _tableMap:Dictionary;
      
      private var timer:Timer;
      
      public function InitDataManager()
      {
         super();
         this._loadqueue = new Array();
         this.timer = new Timer(150);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTime);
         this.timer.start();
      }
      
      public static function getInstance() : InitDataManager
      {
         if(_instance == null)
         {
            _instance = new InitDataManager();
         }
         return _instance;
      }
      
      private function onTime(param1:Event) : void
      {
         this.loadNext();
      }
      
      public function addTask(param1:IInitDataTask) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._loadqueue.push(param1);
      }
      
      public function finishTask(param1:int) : void
      {
         var _loc4_:BasicInitDataTask = null;
         var _loc2_:int = this._loadqueue.length;
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._loadqueue[_loc3_]).id == param1)
            {
               _loc4_.finish();
               break;
            }
            _loc3_++;
         }
      }
      
      public function getFinishedTaskNum() : int
      {
         var _loc4_:BasicInitDataTask = null;
         var _loc1_:int = 0;
         var _loc2_:int = this._loadqueue.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._loadqueue[_loc3_]).isFinish)
            {
               _loc1_++;
            }
            _loc3_++;
         }
         return _loc1_;
      }

      public function loadNext() : void
      {
         var _loc3_:int = 0;
         var _loc4_:BasicInitDataTask = null;
         var _loc1_:int = this.getFinishedTaskNum();
         var _loc2_:int = this._loadqueue.length;
         if (_loc1_ == 14){//Temp hack
            _loc1_ = 25;
         }
         if(_loc1_ >= _loc2_)
         {
            this.clean();
            this.updatePercent(100,0);
            GameDataReport.getInstance().report(GameDataReport.Data_Finish_Connect_Server);
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(!(_loc4_ = this._loadqueue[_loc3_]).isRunning && !_loc4_.isFinish)
               {
                  _loc4_.start();
                  this.updatePercent(int(_loc1_ / _loc2_ * 100),_loc4_.id);
               }
               if(!_loc4_.isFinish && !_loc4_.isParallel)
               {
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      private function updatePercent(param1:int, param2:int) : void
      {
         var _loc3_:String = "";
         switch(param2)
         {
            case Init_ClientDB:
               _loc3_ = "ClientDB Init";
               break;
            case Init_PlayerInfo:
               _loc3_ = "Reading Player Data";
               break;
            case Init_PlayerCard:
               _loc3_ = "Reading Player Card Data";
               break;
            case Init_PlayerGuideInfo:
               _loc3_ = "Reading Player Tutorial Data";
               break;
            case Init_BagItemInfo:
               _loc3_ = "Reading Player Bag Data";
               break;
            case Init_QuestInfo:
               _loc3_ = "Reading Quest Data";
               break;
            case Init_CityInfo:
               _loc3_ = "Reading City Data";
               break;
            case Init_FlagInfo:
               _loc3_ = "Reading Flag Data";
               break;
            case Init_LabInfo:
               _loc3_ = "Reading Lab Data";
               break;
            case Init_UnionInfo:
               _loc3_ = "Reading Union Data";
               break;
            case Init_MapInfo:
               _loc3_ = "Reading Map Data";
               break;
            case Init_BuffInfo:
               _loc3_ = "Reading Buff Data";
               break;
            case Init_ChatInfo:
               _loc3_ = "Reading Chat Data";
               break;
            case Init_Activity:
               _loc3_ = "Reading Event Data";
               break;
            case Init_OnlineReward:
               _loc3_ = "Reading Online Reward Data";
               break;
            default:
               _loc3_ = "Reading Info";
         }
         GameGloble.loader.setProgress(param1,3,_loc3_);
      }
      
      private function clean() : void
      {
         var _loc1_:BasicInitDataTask = null;
         if(this.timer != null)
         {
            this.timer.reset();
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTime);
            this.timer = null;
         }
         while(this._loadqueue.length > 0)
         {
            _loc1_ = this._loadqueue.pop();
            _loc1_.Dispose();
         }
      }
   }
}

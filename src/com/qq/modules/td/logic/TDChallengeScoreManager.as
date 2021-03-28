package com.qq.modules.td.logic
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.templates.ce.TDChallengeScoreTemplateCE;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PData;
   import flash.utils.Dictionary;
   
   public class TDChallengeScoreManager
   {
      
      private static var _instance:TDChallengeScoreManager;
       
      
      private var _scoreDic:Dictionary;
      
      private var _cntDic:Dictionary;
      
      private var _excludeFlowerZombieUidList:Array;
      
      public function TDChallengeScoreManager()
      {
         this._excludeFlowerZombieUidList = [];
         super();
      }
      
      public static function get instance() : TDChallengeScoreManager
      {
         if(_instance == null)
         {
            _instance = new TDChallengeScoreManager();
            _instance.init();
         }
         return _instance;
      }
      
      private function init() : void
      {
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_Zombie_Move,this.onZombieMoveHandler);
      }
      
      private function onZombieMoveHandler(param1:CommonEvent) : void
      {
         var _loc4_:IGameObject = null;
         var _loc2_:IGameObject = (param1.param as Array)[0];
         if(this._excludeFlowerZombieUidList.indexOf(_loc2_.objectModel.uid) >= 0)
         {
            return;
         }
         var _loc3_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Flower);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.objectModel.roadIndex == _loc2_.objectModel.roadIndex)
            {
               if(_loc4_.x > _loc2_.x)
               {
                  this._excludeFlowerZombieUidList.push(_loc2_.objectModel.uid);
                  TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Cross_Flower_Zombie);
                  break;
               }
            }
         }
      }
      
      public function reset() : void
      {
         this._scoreDic = new Dictionary();
         this._cntDic = new Dictionary();
         this._excludeFlowerZombieUidList = [];
      }
      
      public function registerListenType(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:TDChallengeScoreTemplateCE = null;
         var _loc4_:PData = null;
         var _loc5_:PData = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ > 0)
            {
               _loc3_ = TDDataFactory.instance.getInitChallengeScoreByType(_loc2_);
               (_loc4_ = new PData()).set(_loc3_.score);
               this._scoreDic[_loc2_] = _loc4_;
               (_loc5_ = new PData()).set(_loc3_.count);
               this._cntDic[_loc2_] = _loc5_;
            }
         }
         this.refreshTotalScore();
      }
      
      public function setScoreByType(param1:uint, param2:int = 0) : void
      {
         var _loc7_:PData = null;
         if(this._cntDic[param1] == null)
         {
            return;
         }
         var _loc3_:int = TDStageInfo.getInstance().challengeAchiTimeLimit;
         var _loc4_:int = TDGameInfo.getInstance().getCurGameTime();
         if(_loc3_ > 0 && _loc4_ > _loc3_ * 1000)
         {
            return;
         }
         var _loc5_:PData;
         (_loc5_ = this._cntDic[param1]).set(param2);
         this._cntDic[param1] = _loc5_;
         var _loc6_:TDChallengeScoreTemplateCE;
         if(_loc6_ = TDDataFactory.instance.getChallengeScoreByTypeAndCnt(param1,this._cntDic[param1].get()))
         {
            (_loc7_ = new PData()).set(_loc6_.score);
            this._scoreDic[param1] = _loc7_;
         }
         this.refreshTotalScore();
      }
      
      public function isRegisterByType(param1:uint) : Boolean
      {
         if(this._cntDic[param1] != null)
         {
            return true;
         }
         return false;
      }
      
      public function addScoreByType(param1:uint, param2:int = 0) : void
      {
         var _loc7_:PData = null;
         if(this._cntDic[param1] == null)
         {
            return;
         }
         var _loc3_:int = TDStageInfo.getInstance().challengeAchiTimeLimit;
         var _loc4_:int = TDGameInfo.getInstance().getCurGameTime();
         if(_loc3_ > 0 && _loc4_ > _loc3_ * 1000)
         {
            return;
         }
         var _loc5_:PData = this._cntDic[param1];
         if(param2 == 0)
         {
            if(TDChallengeScoreType.Type_Pour_Score_List.indexOf(param1) >= 0)
            {
               _loc5_.set(_loc5_.get() - 1);
            }
            else
            {
               _loc5_.set(_loc5_.get() + 1);
            }
         }
         else
         {
            _loc5_.set(_loc5_.get() + param2);
         }
         this._cntDic[param1] = _loc5_;
         var _loc6_:TDChallengeScoreTemplateCE;
         if(_loc6_ = TDDataFactory.instance.getChallengeScoreByTypeAndCnt(param1,this._cntDic[param1].get()))
         {
            (_loc7_ = new PData()).set(_loc6_.score);
            this._scoreDic[param1] = _loc7_;
         }
         this.refreshTotalScore();
      }
      
      public function getScoreByType(param1:int) : PData
      {
         return this._scoreDic[param1];
      }
      
      public function getCntByType(param1:int) : PData
      {
         return this._cntDic[param1];
      }
      
      private function refreshTotalScore() : void
      {
         var _loc2_:PData = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this._scoreDic)
         {
            if(_loc2_)
            {
               _loc1_ += _loc2_.get();
            }
         }
         TDStageInfo.getInstance().challengeScore.set(_loc1_);
         CommandDispatcher.send(CommandName.TD_Challenge_Score_Changed);
      }
   }
}

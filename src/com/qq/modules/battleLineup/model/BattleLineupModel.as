package com.qq.modules.battleLineup.model
{
   import PVZ.Cmd.Dto_EnemyCardInfo;
   import PVZ.Cmd.Dto_FriendInfo;
   import com.qq.GameGloble;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Int64Util;
   import org.robotlegs.mvcs.Actor;
   
   public class BattleLineupModel extends Actor
   {
      
      public static const LEFT_PANEL_SEL_FRIEND:uint = 1;
      
      public static const LEFT_PANEL_SEL_ME:uint = 2;
       
      
      public var startFightFunc:Function;
      
      public var embattleType:uint;
      
      public var enemyCardPosInfo:Array;
      
      public var helpCardInfo:Array;
      
      public var puppetformation:Array;
      
      public var fight_fuben_chapterId:uint;
      
      public var fight_fuben_modeId:uint;
      
      public var fight_fuben_stageId:uint;
      
      public var fight_type:uint;
      
      public var fight_activity_id:uint;
      
      public var fight_sigleSweep:Boolean;
      
      public var fight_multSweep:Boolean;
      
      public var fight_multSweepTimes:int;
      
      public var fight_fubenId:int;
      
      public var cacheCardInfo:Object;
      
      public var enemyTotalPower:uint;
      
      public var leftPanelSelType:uint = 1;
      
      public function BattleLineupModel()
      {
         this.enemyCardPosInfo = [];
         this.helpCardInfo = [];
         this.puppetformation = [];
         super();
      }
      
      public function clearCacheData() : void
      {
         this.cacheCardInfo = null;
      }
      
      public function removeHelpCard() : void
      {
         GameGloble.actorModel.battleCardModel.defaultFormationVo.removeHelpCard();
      }
      
      public function getHelpCardInfoByUid(param1:Int64) : Dto_FriendInfo
      {
         var _loc4_:Dto_FriendInfo = null;
         var _loc2_:int = this.helpCardInfo.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.helpCardInfo[_loc3_] as Dto_FriendInfo;
            if(Int64Util.isEqual(_loc4_.helpPlant.base.uid,param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getEnemyCardInfoByPosIndex(param1:uint) : Dto_EnemyCardInfo
      {
         var _loc4_:Dto_EnemyCardInfo = null;
         var _loc2_:int = this.enemyCardPosInfo.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.enemyCardPosInfo[_loc3_] as Dto_EnemyCardInfo).posIndex == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}

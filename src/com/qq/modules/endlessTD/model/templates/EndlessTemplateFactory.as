package com.qq.modules.endlessTD.model.templates
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.unit.TDEndlessModeTemplate;
   import com.qq.modules.td.data.game.unit.ce.TDEndlessDiamondTemplateCE;
   import com.qq.modules.td.data.game.unit.ce.TDEndlessLevelTemplateCE;
   import com.qq.modules.td.data.game.unit.ce.TDEndlessRewardTemplateCE;
   import com.qq.modules.td.data.game.unit.ce.TDStrengthenTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class EndlessTemplateFactory
   {
      
      private static var _instance:EndlessTemplateFactory;
       
      
      private var _endlessModeArr:Array;
      
      private var _diamondArr:Array;
      
      private var _levelArr:Array;
      
      private var _reward:Array;
      
      private var _endlessStrengthenArr:Array;
      
      public function EndlessTemplateFactory()
      {
         super();
         this._endlessModeArr = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENDLESS_MODE,TDEndlessModeTemplate);
         this._diamondArr = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENDLESS_USE_DIAMOND,TDEndlessDiamondTemplateCE);
         this._levelArr = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENDLESS_LEVEL,TDEndlessLevelTemplateCE);
         this._reward = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENDLESS_REWARD,TDEndlessRewardTemplateCE);
      }
      
      public static function get instance() : EndlessTemplateFactory
      {
         if(!_instance)
         {
            _instance = new EndlessTemplateFactory();
         }
         return _instance;
      }
      
      public function get endlessModes() : Array
      {
         return this._endlessModeArr;
      }
      
      public function getEndlessModeById(param1:uint) : TDEndlessModeTemplate
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._endlessModeArr.length)
         {
            if(this._endlessModeArr[_loc2_].modeId == param1)
            {
               return this._endlessModeArr[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getStrengthenTemplate(param1:int) : TDStrengthenTemplateCE
      {
         var _loc2_:TDStrengthenTemplateCE = null;
         if(!this._endlessStrengthenArr)
         {
            this._endlessStrengthenArr = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENDLESS_STRENGTHEN,TDStrengthenTemplateCE);
         }
         for each(_loc2_ in this._endlessStrengthenArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getRechallengeNeedDiamond(param1:int) : uint
      {
         if(param1 <= this._diamondArr.length)
         {
            return TDEndlessDiamondTemplateCE(this._diamondArr[param1 - 1]).diamond;
         }
         return 0;
      }
      
      public function getEndlessMaxTimes() : uint
      {
         return this._diamondArr.length;
      }
      
      public function getLevelInfo(param1:int) : TDEndlessLevelTemplateCE
      {
         var _loc2_:TDEndlessLevelTemplateCE = null;
         for each(_loc2_ in this._levelArr)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getRwardByRank(param1:int) : Dto_IdNum
      {
         var _loc2_:Dto_IdNum = null;
         var _loc5_:TDEndlessRewardTemplateCE = null;
         var _loc6_:Array = null;
         var _loc3_:int = this._reward.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this._reward[_loc4_];
            if(param1 >= _loc5_.rankStart && param1 <= _loc5_.rankEnd)
            {
               _loc2_ = new Dto_IdNum();
               _loc6_ = _loc5_.rewardStr.split(":");
               _loc2_.id = _loc6_[0];
               _loc2_.num = _loc6_[1];
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
   }
}

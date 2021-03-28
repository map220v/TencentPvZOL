package com.qq.modules.buffActivity.model
{
   import PVZ.Cmd.Cmd_Market_BuyEnergy_SC;
   import PVZ.Cmd.FlexibleActivity_6;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.buffActivity.BuffActivityGlobal;
   import com.qq.modules.buffActivity.model.buff.BuffAdventure;
   import com.qq.modules.buffActivity.model.buff.BuffBuyPhysical;
   import com.qq.modules.buffActivity.model.buff.BuffExchange;
   import com.qq.modules.buffActivity.model.buff.BuffGarden;
   import com.qq.modules.buffActivity.model.buff.BuffModule;
   import com.qq.modules.buffActivity.model.buff.BuffNutrition;
   import com.qq.modules.buffActivity.model.buff.BuffSeniorAdventure;
   import com.qq.modules.buffActivity.model.buff.BuffTrial;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class BuffActivityProxy extends BasicProxy
   {
       
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      private var m_vecInfo:Vector.<ActivityCommonInfo>;
      
      private var m_vecParam:Vector.<BuffActivityClientParam>;
      
      private var m_exchangeBuff:BuffExchange;
      
      private var m_moduleBuff:BuffModule;
      
      private var m_normalAdventure:BuffAdventure;
      
      private var m_seniorAdventure:BuffSeniorAdventure;
      
      private var m_nutritionBuff:BuffNutrition;
      
      private var m_trialBuff:BuffTrial;
      
      private var m_buyPhysicalBuff:BuffBuyPhysical;
      
      private var m_gardenExpBuff:BuffGarden;
      
      public function BuffActivityProxy()
      {
         super();
      }
      
      private function reset() : void
      {
         var _loc1_:ActivityCommonInfo = null;
         this.m_vecInfo = this.activityProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_WELFARE_HALL);
         this.m_vecParam = new Vector.<BuffActivityClientParam>(this.m_vecInfo.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.m_vecInfo.length)
         {
            _loc1_ = this.m_vecInfo[_loc2_];
            this.m_vecParam[_loc2_] = new BuffActivityClientParam(_loc1_);
            ActivityProxyCmd.getActivityInfo(_loc1_.id);
            _loc2_++;
         }
      }
      
      private function onActivityInit(param1:CommonEvent) : void
      {
         this.reset();
      }
      
      private function onCmd_Market_BuyEnergy_SC(param1:SocketServiceEvent) : void
      {
         this.updateBuff(BuffActivityGlobal.TYPE_ENERGY_CHARGE);
      }
      
      override public function listMsgInterests() : Array
      {
         return [[FlexibleActivity_6.$MessageID,this.onFlexibleActivity_6],[ActivityGlobal.EVENT_ACTIVITY_INIT,this.onActivityInit],[Cmd_Market_BuyEnergy_SC.$MessageID,this.onCmd_Market_BuyEnergy_SC]];
      }
      
      public function get allParam() : Vector.<BuffActivityClientParam>
      {
         return this.m_vecParam;
      }
      
      private function onFlexibleActivity_6(param1:SocketServiceEvent) : void
      {
         var _loc4_:ActivityCommonInfo = null;
         var _loc5_:BuffActivityClientParam = null;
         var _loc2_:FlexibleActivity_6 = param1.socketData as FlexibleActivity_6;
         this.analyzeExchangeBuff(_loc2_);
         this.analyzeModuleBuff(_loc2_);
         this.analyzeNormalAdventure(_loc2_);
         this.analyzeSeniorAdventure(_loc2_);
         this.analyzeNutritionBuff(_loc2_);
         this.analyzeTrialBuff(_loc2_);
         this.analyzeBuyPhysicalBuff(_loc2_);
         this.analyzeGardenExpBuff(_loc2_);
         var _loc3_:int = this.m_vecInfo.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            if((_loc4_ = this.m_vecInfo[_loc6_]).id == _loc2_.activityId)
            {
               _loc5_ = this.m_vecParam[_loc6_];
               this.dispatch(new CommonEvent(BuffActivityGlobal.EVENT_BUFF_UPDATE,_loc5_.type));
            }
            _loc6_++;
         }
      }
      
      public function get exchangeBuff() : BuffExchange
      {
         if(this.m_exchangeBuff == null)
         {
            this.m_exchangeBuff = new BuffExchange();
         }
         return this.m_exchangeBuff;
      }
      
      private function analyzeExchangeBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.hasGoldExchange)
         {
            this.exchangeBuff.conditionChance = param1.goldExchange.id;
            this.exchangeBuff.happenPercent = param1.goldExchange.num;
            this.exchangeBuff.additionPercent = param1.goldExchange.odd;
         }
      }
      
      public function get moduleBuff() : BuffModule
      {
         if(this.m_moduleBuff == null)
         {
            this.m_moduleBuff = new BuffModule();
         }
         return this.m_moduleBuff;
      }
      
      private function analyzeModuleBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.hasActivityFubenNum)
         {
            this.moduleBuff.fightChance = param1.activityFubenNum;
         }
      }
      
      public function get normalAdventure() : BuffAdventure
      {
         if(this.m_normalAdventure == null)
         {
            this.m_normalAdventure = new BuffAdventure();
         }
         return this.m_normalAdventure;
      }
      
      private function analyzeNormalAdventure(param1:FlexibleActivity_6) : void
      {
         if(param1.hasFubenExp)
         {
            this.normalAdventure.cityExpPercent = param1.fubenExp;
         }
         if(param1.hasFubenGold)
         {
            this.normalAdventure.goldPercent = param1.fubenGold;
         }
         if(param1.fubenCardExp)
         {
            this.normalAdventure.cardExpPercent = param1.fubenCardExp;
         }
         if(param1.hasFubenCardPieceTimes)
         {
            this.normalAdventure.puzzleMultiple = param1.fubenCardPieceTimes;
         }
      }
      
      public function get seniorAdventure() : BuffSeniorAdventure
      {
         if(this.m_seniorAdventure == null)
         {
            this.m_seniorAdventure = new BuffSeniorAdventure();
         }
         return this.m_seniorAdventure;
      }
      
      private function analyzeSeniorAdventure(param1:FlexibleActivity_6) : void
      {
         if(param1.hasEliteFubenNum)
         {
            this.seniorAdventure.fightChance = param1.eliteFubenNum;
         }
         if(param1.hasEliteFubenExp)
         {
            this.seniorAdventure.cityExpPercent = param1.eliteFubenExp;
         }
         if(param1.hasEliteFubenGold)
         {
            this.seniorAdventure.goldPercent = param1.eliteFubenGold;
         }
         if(param1.eliteFubenCardExp)
         {
            this.seniorAdventure.cardExpPercent = param1.eliteFubenCardExp;
         }
         if(param1.hasEliteFubenDebrisTimes)
         {
            this.seniorAdventure.debrisMultiple = param1.eliteFubenDebrisTimes;
         }
         if(param1.hasEliteFubenCardPieceTimes)
         {
            this.seniorAdventure.puzzleMultiple = param1.eliteFubenCardPieceTimes;
         }
      }
      
      public function get nutritionBuff() : BuffNutrition
      {
         if(this.m_nutritionBuff == null)
         {
            this.m_nutritionBuff = new BuffNutrition();
         }
         return this.m_nutritionBuff;
      }
      
      private function analyzeNutritionBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.hasNutritionDiscount)
         {
            this.nutritionBuff.callRebate = param1.nutritionDiscount;
         }
      }
      
      public function get trialBuff() : BuffTrial
      {
         if(this.m_trialBuff == null)
         {
            this.m_trialBuff = new BuffTrial(ServerConfigTemplateFactory.instance.sScrewUpAddNumCost);
         }
         return this.m_trialBuff;
      }
      
      private function analyzeTrialBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.hasScrewUpAddNum)
         {
            this.trialBuff.resetCount = param1.screwUpAddNum;
         }
         if(param1.hasScrewUpAddTime)
         {
            this.trialBuff.resetTime = param1.screwUpAddTime;
         }
         if(param1.hasScrewUpAddNumUsed)
         {
            this.trialBuff.usedCount = param1.screwUpAddNumUsed;
         }
      }
      
      public function get buyPhysicalBuff() : BuffBuyPhysical
      {
         if(this.m_buyPhysicalBuff == null)
         {
            this.m_buyPhysicalBuff = new BuffBuyPhysical();
         }
         return this.m_buyPhysicalBuff;
      }
      
      private function analyzeBuyPhysicalBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.buyEnergyPrice && param1.buyEnergyPrice.length > 0)
         {
            this.buyPhysicalBuff.prices = param1.buyEnergyPrice;
            this.buyPhysicalBuff.ignoreVip = param1.ignoreBuyEnergyVipLimit > 0;
            this.buyPhysicalBuff.availableTimes = param1.availableBuyEnergyNum;
         }
      }
      
      public function get gardenExpBuff() : BuffGarden
      {
         if(this.m_gardenExpBuff == null)
         {
            this.m_gardenExpBuff = new BuffGarden();
         }
         return this.m_gardenExpBuff;
      }
      
      private function analyzeGardenExpBuff(param1:FlexibleActivity_6) : void
      {
         if(param1.hasGardenExpRate)
         {
            this.gardenExpBuff.gardenExpRate = param1.gardenExpRate;
         }
      }
      
      public function getBuffTip(param1:String) : Array
      {
         var _loc4_:BuffActivityClientParam = null;
         var _loc5_:ActivityCommonInfo = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         for each(_loc4_ in this.m_vecParam)
         {
            if(_loc4_.type == param1)
            {
               if((_loc5_ = this.m_vecInfo[_loc3_]) && _loc5_.open)
               {
                  _loc2_.push(_loc4_.tip);
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function hasBuff(param1:String) : Boolean
      {
         var _loc2_:BuffActivityClientParam = null;
         for each(_loc2_ in this.m_vecParam)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_.activityCommonInfo.open;
            }
         }
         return false;
      }
      
      public function updateBuff(param1:String) : void
      {
         var _loc3_:BuffActivityClientParam = null;
         var _loc4_:ActivityCommonInfo = null;
         var _loc2_:int = this.m_vecParam.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = this.m_vecParam[_loc5_];
            if(_loc3_.type == param1)
            {
               _loc4_ = this.m_vecInfo[_loc5_];
               ActivityProxyCmd.getActivityInfo(_loc4_.id);
            }
            _loc5_++;
         }
      }
   }
}

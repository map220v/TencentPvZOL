package com.qq.modules.battle.view.unit
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Dto_FightCardInfo;
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.control.UnitAwakeCtr;
   import com.qq.modules.battle.view.control.UnitBloodCtr;
   import com.qq.modules.battle.view.control.UnitBuffCtr;
   import com.qq.modules.battle.view.control.UnitCardDNACtr;
   import com.qq.modules.battle.view.control.UnitPlantArmorCtr;
   import com.qq.modules.battle.view.control.UnitProgressCtr;
   import com.qq.modules.battle.view.control.UnitRageCtr;
   import com.qq.modules.battle.view.control.UnitShiedCtr;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.modules.embattle.view.comps.PlantHomeCardToolTip;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import com.qq.tooltip.DummyZombieTooltip;
   import com.qq.tooltip.PlantCardToolTip;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class UnitFactory
   {
      
      private static var _instance:UnitFactory;
       
      
      public function UnitFactory(param1:Lock)
      {
         super();
      }
      
      public static function get instance() : UnitFactory
      {
         if(!_instance)
         {
            _instance = new UnitFactory(new Lock());
         }
         return _instance;
      }
      
      public function createUnit() : UnitBase
      {
         var _loc1_:UnitBase = new UnitBase();
         BattleUnitModel.getInstance().battleTimer.addUnit(_loc1_);
         return _loc1_;
      }
      
      public function removeUnit(param1:UnitBase) : void
      {
         BattleUnitModel.getInstance().battleTimer.removeUnit(param1);
      }
      
      public function updateDummyBase(param1:UnitBase, param2:Boolean) : void
      {
         param1.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Effect,"dummyBase." + GameGloble.BONE_FILE_EXT),30,"idle",true);
         var _loc3_:int = BattleConst.GRID_WIDTH * 3.5 + (!!param2 ? -1 : 1) * (BattleConst.GRID_WIDTH + 20);
         var _loc4_:int = -10;
         param1.setXY(_loc3_,_loc4_);
         if(param2)
         {
            param1.mirror();
         }
      }
      
      public function updateDummy(param1:UnitBase, param2:Dto_FightPuppetInfo, param3:PlanSetting) : void
      {
         param1.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Unit,param3.assetTree.unitAssetName),30,"idle",true);
         param1.setAlpha(0);
         var _loc4_:Point = BattleConst.getCardXYByPosindex(param2.posIndex);
         param1.setXY(_loc4_.x,_loc4_.y);
         if(param2.posIndex % 2 == 1)
         {
            param1.mirror();
         }
         var _loc5_:DummyZombieInfo;
         (_loc5_ = new DummyZombieInfo(param2.baseId)).resetDtoInfo(param2);
         param1.animatCav.toolTip = _loc5_;
         param1.animatCav.toolTipClass = DummyZombieTooltip;
      }
      
      public function updateUnit(param1:UnitBase, param2:Dto_FightCardInfo, param3:PlanSetting, param4:Boolean = true) : void
      {
         var _loc6_:CardChestAvatarTemp = null;
         var _loc11_:UnitAwakeCtr = null;
         var _loc12_:UnitCardDNACtr = null;
         var _loc13_:int = 0;
         var _loc14_:UnitPlantArmorCtr = null;
         param1.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Unit,param3.assetTree.unitAssetName),30,"idle",true);
         var _loc5_:Point = BattleConst.getCardXYByPosindex(param2.posIndex);
         param1.setXY(_loc5_.x,_loc5_.y);
         if(param2.avatarId == 0)
         {
            param1.setHideBones(SettingsModel.instance.battleCardSettings.getBattleCardTempById(param2.cardId).hideBoneList);
            if(_loc6_ = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(SettingsModel.instance.battleCardSettings.getBattleCardTempById(param2.cardId).tdId))
            {
               param1.setAvatar(_loc6_);
            }
         }
         else
         {
            param1.setAvatar(CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2.avatarId));
         }
         var _loc7_:UnitProgressCtr;
         (_loc7_ = new UnitProgressCtr()).hasShield = param2.maxShield.toNumber() == 0 ? false : true;
         _loc7_.rageMax = param2.maxRage;
         _loc7_.baseRage = param2.rage;
         param1.addControl(_loc7_);
         _loc7_.changeHP(param2.hp.toNumber() / param2.maxHp.toNumber());
         var _loc8_:UnitRageCtr;
         (_loc8_ = new UnitRageCtr()).setRageEffect(param3.rageEffectType);
         param1.addControl(_loc8_);
         var _loc9_:UnitBuffCtr = new UnitBuffCtr();
         param1.addControl(_loc9_);
         param1.addControl(new UnitBloodCtr());
         param1.addControl(new UnitShiedCtr());
         var _loc10_:BattleLineupCardTemp;
         if((_loc10_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param2.cardId)) && _loc10_.awakeLevel > 0)
         {
            _loc11_ = new UnitAwakeCtr();
            param1.addControl(_loc11_);
            _loc11_.setAwakeLevel(_loc10_.awakeLevel);
         }
         if(param2.geneId > 0)
         {
            _loc12_ = new UnitCardDNACtr();
            param1.addControl(_loc12_);
            _loc12_.setDNAEffect(param2.geneId);
         }
         if(param2.armorStar > 0)
         {
            _loc13_ = GameGloble.getPlantArmorViewID(param2.armorType,param2.armorStar);
            _loc14_ = new UnitPlantArmorCtr();
            param1.addControl(_loc14_);
            _loc14_.setPlantArmorEffect(_loc13_);
         }
         if(param4 && param2.isLeader && param2.posIndex % 2 == 0)
         {
            param1.setScale(1.2,1.2);
         }
         if(param3.assetTree.rightSideMirror == 1 && param2.posIndex % 2 == 0)
         {
            param1.mirror();
         }
         param1.animatCav.toolTip = param2;
         if(BattleFightModel.getInstance().battleType == BattleTargetType.BattleTargetType_MapWar || BattleFightModel.getInstance().battleType == BattleTargetType.BattleTargetType_Temple || BattleFightModel.getInstance().battleType == BattleTargetType.BattleTargetType_Mine)
         {
            param1.animatCav.toolTipClass = PlantHomeCardToolTip;
         }
         else
         {
            param1.animatCav.toolTipClass = PlantCardToolTip;
         }
         if(param2.hasIsLive && param2.isLive == false)
         {
            param1.display.visible = false;
         }
      }
      
      protected function rollOverHandler(param1:Event) : void
      {
      }
   }
}

class Lock
{
    
   
   function Lock()
   {
      super();
   }
}

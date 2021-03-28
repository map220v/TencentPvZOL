package com.qq.modules.battle.view.control.unitBuff
{
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleBuffInfo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.dummy.DummyGlobel;
   import com.qq.modules.dummy.model.DummyBuffTemplate;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.templates.ce.DummyBuffEffectInfoCE;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardBuffTemplateCE;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardStateTemplateCE;
   import flash.geom.ColorTransform;
   
   public class BattleBuffFactory
   {
      
      public static const BUFF_EFF_ONLY:uint = 1;
      
      private static const BUFF_ICE:int = 1001;
      
      private static const BUFF_PALSY:int = 1002;
      
      private static const BUFF_POISON:int = 1003;
      
      private static const BUFF_ENRAGE:int = 1004;
      
      private static const BUFF_RALLY:int = 1005;
      
      private static const BUFF_HIDE:int = 1008;
       
      
      public function BattleBuffFactory()
      {
         super();
      }
      
      public static function getBuffEffectTemplate(param1:int, param2:int) : Object
      {
         var _loc3_:BattleLineupCardStateTemplateCE = null;
         var _loc4_:BattleLineupCardBuffTemplateCE = null;
         var _loc5_:DummyBuffTemplate = null;
         var _loc6_:DummyBuffEffectInfoCE = null;
         if(param2 == BattleConst.BUFF_TYPE_CARD)
         {
            _loc3_ = BattleLineupTemplateFactory.instance.getBattleLineupCardStateTemplateById(param1);
            if(_loc3_ != null)
            {
               return BattleLineupTemplateFactory.instance.getBattleLineupCardBuffTemplateById(_loc3_.effectId);
            }
         }
         else if((_loc5_ = DummyDataFactory.getInstance().getBuffInfoByID(param1)) != null)
         {
            return DummyDataFactory.getInstance().getBuffEffectInfoByID(_loc5_.effectId);
         }
         return null;
      }
      
      public static function getBuffIcon(param1:int, param2:int) : String
      {
         var _loc3_:Object = getBuffEffectTemplate(param1,param2);
         if(_loc3_ == null)
         {
            return "";
         }
         if(_loc3_ is DummyBuffEffectInfoCE)
         {
            return (_loc3_ as DummyBuffEffectInfoCE).icon;
         }
         if(_loc3_ is BattleLineupCardBuffTemplateCE)
         {
            return (_loc3_ as BattleLineupCardBuffTemplateCE).icon;
         }
         return "";
      }
      
      public static function getBuffEffectResName(param1:int, param2:int) : String
      {
         var _loc3_:Object = getBuffEffectTemplate(param1,param2);
         if(_loc3_ == null)
         {
            return "";
         }
         if(_loc3_ is DummyBuffEffectInfoCE)
         {
            return (_loc3_ as DummyBuffEffectInfoCE).effect;
         }
         if(_loc3_ is BattleLineupCardBuffTemplateCE)
         {
            return (_loc3_ as BattleLineupCardBuffTemplateCE).effect;
         }
         return "";
      }
      
      public static function getBuffalign(param1:int, param2:int) : int
      {
         var _loc3_:Object = getBuffEffectTemplate(param1,param2);
         if(_loc3_ == null)
         {
            return 1;
         }
         if(_loc3_ is DummyBuffEffectInfoCE)
         {
            return (_loc3_ as DummyBuffEffectInfoCE).align;
         }
         if(_loc3_ is BattleLineupCardBuffTemplateCE)
         {
            return (_loc3_ as BattleLineupCardBuffTemplateCE).align;
         }
         return 1;
      }
      
      public static function getBuffDesc(param1:BattleBuffInfo) : String
      {
         var _loc2_:BattleLineupCardStateTemplateCE = null;
         if(param1 == null)
         {
            return "";
         }
         if(param1.buffType == BattleConst.BUFF_TYPE_CARD)
         {
            _loc2_ = BattleLineupTemplateFactory.instance.getBattleLineupCardStateTemplateById(param1.buffID);
            return _loc2_.desc;
         }
         return DummyGlobel.getBuffDesc(param1.buffID,param1.skillLv);
      }
      
      public static function getOnlyEffect(param1:int, param2:int) : int
      {
         var _loc3_:Object = getBuffEffectTemplate(param1,param2);
         if(_loc3_ == null)
         {
            return 0;
         }
         if(_loc3_ is DummyBuffEffectInfoCE)
         {
            return (_loc3_ as DummyBuffEffectInfoCE).onlyEff;
         }
         if(_loc3_ is BattleLineupCardBuffTemplateCE)
         {
            return (_loc3_ as BattleLineupCardBuffTemplateCE).onlyEff;
         }
         return 0;
      }
      
      public static function createBuffById(param1:BattleBuffInfo, param2:UnitBase, param3:uint) : UnitBuff
      {
         var _loc4_:UnitBuff = null;
         var _loc5_:int = -1;
         var _loc6_:Object = BattleBuffFactory.getBuffEffectTemplate(param1.buffID,param1.buffType);
         if(param1.buffType == BattleConst.BUFF_TYPE_CARD)
         {
            if(_loc6_ != null)
            {
               _loc5_ = _loc6_.id;
            }
            switch(_loc5_)
            {
               case -1:
                  _loc4_ = new UnitBuff();
                  break;
               case BUFF_ICE:
                  _loc4_ = new UnitBuffIce();
                  break;
               case BUFF_PALSY:
                  _loc4_ = new UnitBuffColorTransfor(new ColorTransform(1,1,1,1,8,52,183,0));
                  break;
               case BUFF_POISON:
                  _loc4_ = new UnitBuffPoison();
                  break;
               case BUFF_ENRAGE:
                  _loc4_ = new UnitBuffColorTransfor(new ColorTransform(1,1,1,1,105,48,-76,0));
                  break;
               case BUFF_RALLY:
                  _loc4_ = new UnitBuffRally();
                  break;
               case BUFF_HIDE:
                  _loc4_ = new UnitBuffColorTransfor(new ColorTransform(1,1,1,0.3));
                  break;
               default:
                  _loc4_ = new UnitBuffWithEffect();
            }
         }
         else
         {
            _loc4_ = new UnitBuff();
         }
         _loc4_.setInfo(param1,param3);
         if(param2 != null)
         {
            _loc4_.setData(param2);
         }
         return _loc4_;
      }
   }
}

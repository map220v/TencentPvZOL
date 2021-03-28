package com.qq.modules.td.logic.unit.object
{
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDNormalObjectData;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.bt_ai.AIFileConstant;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PData;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class TDNormalObject extends GameObject
   {
       
      
      public var objData:TDNormalObjectData;
      
      public var hasAI:Boolean;
      
      public function TDNormalObject()
      {
         super();
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.objData = param1 as TDNormalObjectData;
      }
      
      override public function start() : void
      {
         super.start();
         if(this.objData.objectStaticInfo.AIMode != null && this.objData.objectStaticInfo.AIMode.length > 0)
         {
            this.hasAI = true;
            if(AIFileConstant[this.objData.objectStaticInfo.AIMode])
            {
               BehaviourTreeCenter.instance.addAITreeByConfigClass(this.uid,this.model.staticInfo.type,AIFileConstant[this.objData.objectStaticInfo.AIMode] as Class,[this]);
            }
            else
            {
               BehaviourTreeCenter.instance.addAITreeByCode(this.uid,this.model.staticInfo.type,this.objData.objectStaticInfo.AIMode,[this]);
            }
            this.runAI();
         }
         else if(model.staticInfo.actionNameList.length > 0)
         {
            setAction(model.staticInfo.actionNameList[0]);
         }
      }
      
      public function runAI(param1:Boolean = false) : void
      {
         if(this.hasAI)
         {
            if(param1 && this.isFrozenAI())
            {
               this.setFrozenAI(false);
            }
            if(this.isFrozenAI())
            {
               return;
            }
            BehaviourTreeCenter.instance.runAI(this.uid);
         }
      }
      
      override protected function initAnmi(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.initAnmi(param1,param2);
         this.initHideBones();
      }
      
      protected function initHideBones() : void
      {
         var _loc1_:IBlitDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc2_:TDNormalObjectStaticInfo = this.objData.staticInfo as TDNormalObjectStaticInfo;
         if(_loc2_.InitHideBones)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.InitHideBones.length)
            {
               _loc4_ = _loc2_.InitHideBones[_loc3_];
               animation.setBoneVisibleRule(_loc4_,false);
               _loc3_++;
            }
         }
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:PData = null;
         var _loc5_:Boolean = false;
         if(param1 != 0)
         {
            if((_loc7_ = (_loc6_ = objectModel.curHp.get()) + param1) <= 0)
            {
               _loc7_ = 0;
               if(objectModel.unitType == TDConstant.UnitType_TDTomb)
               {
                  if((_loc8_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDTomb)).length == 1)
                  {
                     if((_loc9_ = TDChallengeScoreManager.instance.getCntByType(TDChallengeScoreType.Remove_All_Tomb)) && _loc9_.get() == 0)
                     {
                        TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Remove_All_Tomb,TDGameInfo.getInstance().getCurGameTime() / 1000);
                        CommandDispatcher.send(CommandName.TD_STOP_CHALLENGE_TIME_RECORD);
                     }
                  }
               }
            }
            if(_loc7_ > objectModel.maxHp.get())
            {
               _loc7_ = objectModel.maxHp.get();
            }
            if(_loc6_ != _loc7_)
            {
               _loc5_ = true;
               objectModel.curHp.set(_loc7_);
               if(objectModel.curHp.get() <= 0)
               {
                  hideHPState();
               }
            }
         }
         if(_loc5_)
         {
            this.updateHPBar();
         }
         return false;
      }
      
      protected function updateHPBar() : void
      {
         if(objectModel.camp == TDConstant.TDCamp_Enemy && objectModel.curHp.get() > 0)
         {
            showHPState();
         }
      }
   }
}

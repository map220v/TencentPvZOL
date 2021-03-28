package com.qq.modules.td.logic
{
   import com.qq.CommandName;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDConditionTriggerVO;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.lua.LuaManager;
   import flash.utils.Dictionary;
   
   public class TDConditionTriggerManager
   {
      
      private static var _instance:TDConditionTriggerManager;
       
      
      private var _conditionVODic:Dictionary;
      
      private var _conditionDic:Dictionary;
      
      public function TDConditionTriggerManager()
      {
         this._conditionVODic = new Dictionary(true);
         this._conditionDic = new Dictionary(true);
         super();
      }
      
      public static function get instance() : TDConditionTriggerManager
      {
         if(_instance == null)
         {
            _instance = new TDConditionTriggerManager();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:XMLList = null;
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:TDConditionTriggerVO = null;
         this._conditionDic = new Dictionary(true);
         this._conditionVODic = new Dictionary(true);
         var _loc1_:XML = TDStageInfo.getInstance().stageMapXml;
         if(_loc1_ && _loc1_.stages && _loc1_.stages.stage && _loc1_.stages.stage.conditions)
         {
            _loc2_ = _loc1_.stages.stage.conditions;
            if(_loc2_ && _loc2_.length() > 0)
            {
               _loc3_ = _loc2_[0].condition;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length())
               {
                  _loc5_ = _loc3_[_loc4_];
                  (_loc6_ = new TDConditionTriggerVO()).conditionId = uint(_loc5_.@id);
                  _loc6_.actCode = String(_loc5_.@act);
                  _loc6_.repeate = Boolean(int(_loc5_.@repeate) == 1);
                  _loc6_.doneCnt = 0;
                  this.registerConditionTrigger(_loc6_);
                  _loc4_++;
               }
            }
         }
      }
      
      public function registerConditionTrigger(param1:TDConditionTriggerVO) : void
      {
         if(this._conditionVODic[param1.conditionId] == null)
         {
            this._conditionVODic[param1.conditionId] = new Vector.<TDConditionTriggerVO>();
         }
         this._conditionVODic[param1.conditionId].push(param1);
      }
      
      public function unRegisterConditionTrigger(param1:uint) : void
      {
         this._conditionVODic[param1] = null;
      }
      
      public function getConditionTrigger(param1:uint) : Vector.<TDConditionTriggerVO>
      {
         return this._conditionVODic[param1];
      }
      
      public function addCondition(param1:uint, param2:*) : void
      {
         var _loc3_:Vector.<TDConditionTriggerVO> = null;
         var _loc4_:TDConditionTriggerVO = null;
         if(this._conditionDic[param1] == null)
         {
            this._conditionDic[param1] = param2;
            _loc3_ = this._conditionVODic[param1];
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ != null && (_loc4_.doneCnt == 0 || _loc4_.repeate))
               {
                  ++_loc4_.doneCnt;
                  LuaManager.doString(_loc4_.actCode);
               }
            }
            CommandDispatcher.send(CommandName.TD_CONDITION_CHANGE,param1);
         }
      }
      
      public function removeCondition(param1:uint) : void
      {
         if(this._conditionDic[param1] != null)
         {
            this._conditionDic[param1] = null;
            CommandDispatcher.send(CommandName.TD_CONDITION_CHANGE,param1);
         }
      }
      
      public function setActTimes(param1:uint, param2:int) : void
      {
         var _loc3_:Vector.<TDConditionTriggerVO> = null;
         var _loc4_:TDConditionTriggerVO = null;
         if(this._conditionDic[param1] != null)
         {
            _loc3_ = this._conditionVODic[param1];
            for each(_loc4_ in _loc3_)
            {
               _loc4_.doneCnt = param2;
            }
         }
      }
      
      public function getCondition(param1:uint) : *
      {
         return this._conditionDic[param1];
      }
   }
}

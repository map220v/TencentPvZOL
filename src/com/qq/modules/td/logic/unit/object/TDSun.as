package com.qq.modules.td.logic.unit.object
{
   import com.qq.CommandName;
   import com.qq.TDPrivilegeInfo;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDNormalObjectData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import tencent.base.utils.DelayCall;
   
   public class TDSun extends TDNormalObject
   {
       
      
      public var beCatchingStep:int = 0;
      
      public var zombieCatcher:IGameObject;
      
      public var sunData:TDNormalObjectData;
      
      public var dropTargetPoint:Point;
      
      private var _isBig:Boolean = false;
      
      private var _sunValue:PData;
      
      public function TDSun()
      {
         super();
         this.dropTargetPoint = new Point();
         this._sunValue = new PData();
      }
      
      public function get isBig() : Boolean
      {
         return this._isBig;
      }
      
      public function set isBig(param1:Boolean) : void
      {
         this._isBig = param1;
      }
      
      public function set sunValue(param1:int) : void
      {
         this._sunValue.set(param1);
      }
      
      public function get sunValue() : int
      {
         return this._sunValue.get();
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.sunData = param1 as TDNormalObjectData;
      }
      
      public function setTarget(param1:Number, param2:Number) : void
      {
         this.dropTargetPoint.x = param1;
         this.dropTargetPoint.y = param2;
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override protected function initListener() : void
      {
         addMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege && TDGameInfo.getInstance().sunAutoCollect)
         {
            DelayCall.call(500,this.autoRollOver);
         }
      }
      
      public function autoRollOver() : void
      {
         this.onRollOver();
      }
      
      private function onRollOver() : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         setAction(TDConstant.SunAction_Fly);
         CommandDispatcher.send(CommandName.TD_CollectSun,{"obj":this});
         if(TDConditionTriggerManager.instance.getCondition(TDConditionID.CATCH_FIRST_SUN) == true)
         {
            TDConditionTriggerManager.instance.removeCondition(TDConditionID.CATCH_FIRST_SUN);
         }
         else
         {
            TDConditionTriggerManager.instance.addCondition(TDConditionID.CATCH_FIRST_SUN,true);
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.zombieCatcher = null;
         super.dispose();
      }
   }
}

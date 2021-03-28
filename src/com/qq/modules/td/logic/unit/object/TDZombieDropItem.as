package com.qq.modules.td.logic.unit.object
{
   import asgui.blit.Blit;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.StateMachine;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class TDZombieDropItem extends TDNormalObject
   {
       
      
      public var groundY:int;
      
      private var _dropType:int;
      
      private var _armorName:String;
      
      private var _itemBox:IBlitDisplayContainer;
      
      public function TDZombieDropItem()
      {
         super();
      }
      
      override public function init(param1:Boolean = false, param2:Boolean = false) : void
      {
      }
      
      public function initDropItem(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:String = null) : void
      {
         this._dropType = param5;
         this._armorName = param6;
         _stateMachine = new StateMachine();
         frontLayer.addEventListener(Event.ADDED,onAddToStage);
         initListener();
         var _loc7_:TDMapRoadData = TDGameInfo.getInstance().getRoadInfo(param4);
         this.groundY = _loc7_.endY + 40;
      }
      
      public function initDrop(param1:IGameObject, param2:Array) : void
      {
         var _loc5_:IBlitDisplayObject = null;
         this._itemBox = Blit.factory.CreateBlitContainer();
         frontLayer.x = param1.frontLayer.x + param1.animation.offsetX;
         frontLayer.y = param1.frontLayer.y + param1.animation.offsetY;
         var _loc3_:int = param2.length - 1;
         while(_loc3_ >= 0)
         {
            if((_loc5_ = param1.animation.getBoneClone(param2[_loc3_])) == null)
            {
               getLogger().warn("掉落物件失败，参数：" + param2[_loc3_] + ", " + param1.animation.currentFrame);
            }
            else
            {
               _loc5_.x += param1.animation.offsetX;
               _loc5_.y += param1.animation.offsetY;
               this._itemBox.AddChild(_loc5_);
            }
            _loc3_--;
         }
         frontLayer.addChild(this._itemBox.asset);
         this._itemBox.x = 0;
         this._itemBox.y = 0;
         _stateMachine = new StateMachine();
         frontLayer.addEventListener(Event.ADDED,onAddToStage);
         var _loc4_:TDMapRoadData;
         if(!(_loc4_ = TDGameInfo.getInstance().getRoadInfo(param1.objectModel.roadIndex)))
         {
            _loc4_ = TDGameInfo.getInstance().getRoadInfo(TDGameInfo.getInstance().minRow);
         }
         if(model.unitType == TDConstant.UnitType_DropItem)
         {
            this.groundY = _loc4_.endY + 80;
         }
         else if(model.unitType == TDConstant.UnitType_DropHand)
         {
            this.groundY = _loc4_.endY + 20;
         }
         else
         {
            this.groundY = _loc4_.endY + 40;
         }
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         if(_stateMachine == null)
         {
            return;
         }
         switchAction(param1,param2,param3);
      }
      
      override public function start() : void
      {
         super.start();
      }
   }
}

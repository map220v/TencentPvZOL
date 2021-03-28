package com.qq.modules.td.logic.unit.object
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.unitFunctor.SparsGroup;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import tencent.base.utils.DelayCall;
   import tencent.tools.group.GroupManager;
   
   public class TDSpars extends TDNormalObject
   {
       
      
      private var hitObjList:Array;
      
      private var group:SparsGroup;
      
      private var slippingBegin:Array;
      
      private var slippingBeginOffset:Array;
      
      private var slippingEnd:Array;
      
      private var slippingEndOffset:Array;
      
      private var speed:int;
      
      private var targetZombieList:Array;
      
      private var fromPoint:Point;
      
      private var endPoint:Point;
      
      private var baseSortIndexOffst:Number;
      
      public function TDSpars()
      {
         this.hitObjList = [];
         super();
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         objData.camp = TDConstant.TDCamp_Enemy;
         this.targetZombieList = [];
      }
      
      override public function init(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.init(param1,param2);
         this.createBlockGrid();
         animation.display.mouseEnabled = false;
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_ADD_ZOMBIE_TO_SPARS,this.addZombieHandler);
      }
      
      private function addZombieHandler(param1:CommonEvent) : void
      {
         this.addZombieToSpars(param1.param.object as BasicZombie);
      }
      
      public function addZombieToSpars(param1:BasicZombie) : void
      {
         if(!param1.isVaild)
         {
            return;
         }
         if(param1.hasStartDie)
         {
            return;
         }
         this.targetZombieList.push(param1);
         this.endPoint = TDGameInfo.getInstance().getZomebiePosByTile(this.slippingEnd[1],this.slippingEnd[0]);
         this.endPoint.offset(this.slippingEndOffset[0],this.slippingEndOffset[1]);
         this.fromPoint = TDGameInfo.getInstance().getZombieStartWalkPos(this.slippingBegin[0]);
         this.fromPoint.offset(this.slippingBeginOffset[0],this.slippingBeginOffset[1]);
         this.speed = 2;
         param1.setLocation(this.fromPoint.x,this.fromPoint.y);
         param1.setAction(TDConstant.ZAction_Idle);
         param1.setFrozenAI(true);
         param1.model.addBuff(TDConstant.TDBuffID_God,param1);
         param1.model.isFlying = true;
         CommandDispatcher.send(CommandName.TD_ForceSortDepth);
      }
      
      override public function update() : void
      {
         var _loc3_:BasicZombie = null;
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         super.update();
         var _loc1_:uint = this.targetZombieList.length;
         var _loc2_:int = _loc1_ - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.targetZombieList[_loc2_] as BasicZombie;
            if(!_loc3_)
            {
               return;
            }
            this.fromPoint = new Point(_loc3_.x,_loc3_.y);
            if((_loc4_ = Point.distance(this.fromPoint,this.endPoint)) > this.speed)
            {
               _loc5_ = Point.interpolate(this.endPoint,this.fromPoint,this.speed / _loc4_);
               this.fromPoint = _loc5_;
               _loc3_.setLocation(this.fromPoint.x,this.fromPoint.y);
            }
            else
            {
               _loc3_.setLocation(this.endPoint.x,this.endPoint.y);
               this.removeZombieToSpars(_loc3_);
               _loc3_.setFrozenAI(false);
               _loc3_.model.removeBuff(TDConstant.TDBuffID_God);
               _loc3_.model.isFlying = false;
               CommandDispatcher.send(CommandName.TD_ForceSortDepth);
               _loc3_.objectModel.roadIndex = TDGameInfo.getInstance().getRoadIndex(this.endPoint.y);
            }
            _loc2_--;
         }
      }
      
      private function removeZombieToSpars(param1:BasicZombie) : void
      {
         param1.setFrozenAI(false);
         var _loc2_:int = 0;
         while(_loc2_ < this.targetZombieList.length)
         {
            if((this.targetZombieList[_loc2_] as BasicZombie).uid == param1.uid)
            {
               this.targetZombieList.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
      }
      
      private function createBlockGrid() : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:IGameObject = null;
         var _loc7_:Array = null;
         var _loc1_:Dictionary = getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam);
         if(_loc1_ != null)
         {
            _loc2_ = (_loc1_["slippingBegin"] as String).split("|");
            this.slippingBegin = (_loc2_[0] as String).split(":");
            this.slippingBeginOffset = (_loc2_[1] as String).split(":");
            _loc2_ = (_loc1_["slippingEnd"] as String).split("|");
            this.slippingEnd = (_loc2_[0] as String).split(":");
            this.slippingEndOffset = (_loc2_[1] as String).split(":");
            _loc3_ = _loc1_["hitGrid"];
            if(_loc3_ == "")
            {
               return;
            }
            _loc4_ = _loc3_.split("|");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_SPARS_BLOCK_ITEM);
               this.hitObjList.push(_loc6_);
               GroupManager.getInstance().addToGroup(SparsGroup.NAME,_loc6_ as TDSparsBlockItem,SparsGroup);
               _loc7_ = (_loc4_[_loc5_] as String).split(":");
               TDGameObjectCmd.addNormalGameObjectByColRow(_loc6_,_loc7_[1],_loc7_[0]);
               _loc6_.setAction(TDConstant.Achieve_idle);
               _loc5_++;
            }
            this.group = GroupManager.getInstance().getGroupFromID(SparsGroup.NAME) as SparsGroup;
            this.group.dispatcher.addEventListener(SparsGroup.EVENT_CHANGE_HP,this.changeHPHandler);
         }
      }
      
      protected function changeHPHandler(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param.changeHP as Number;
         var _loc3_:IGameObject = param1.param.attackTarget as IGameObject;
         this.changeHp(_loc2_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_loc3_);
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         super.changeHp(param1,param2,param3,param4);
         playHitEffect();
         var _loc5_:Number;
         if((_loc5_ = objectModel.curHp.get() / objectModel.maxHp.get()) < 0.5)
         {
            if(animation)
            {
               animation.gotoAndStop("d2");
            }
         }
         if(objectModel.curHp.get() <= 0)
         {
            if(animation)
            {
               animation.gotoAndStop("d3");
            }
            TweenMax.to(frontLayer,1,{"alpha":0});
            DelayCall.call(1000,this.dispose,true);
            this.clear();
         }
         return false;
      }
      
      private function clear() : void
      {
         var _loc5_:IGameObject = null;
         var _loc6_:BasicZombie = null;
         var _loc1_:uint = this.hitObjList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            (_loc5_ = this.hitObjList[_loc2_] as IGameObject).dispose();
            _loc2_++;
         }
         this.hitObjList = [];
         this.targetZombieList = [];
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_ADD_ZOMBIE_TO_SPARS,this.addZombieHandler);
         this.group.dispatcher.removeEventListener(SparsGroup.EVENT_CHANGE_HP,this.changeHPHandler);
         var _loc3_:Array = TDGameInfo.getInstance().getZombieList();
         _loc1_ = _loc3_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            if((_loc6_ = _loc3_[_loc4_] as BasicZombie).model.hasBuff(TDConstant.TDBuffID_Block))
            {
               _loc6_.model.removeBuff(TDConstant.TDBuffID_Block);
            }
            _loc4_++;
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         super.dispose(param1);
      }
   }
}

package com.qq.modules.td.logic.unit.object
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.TDNormalObjectData;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PData;
   import com.qq.utils.db.ClientDBTableName;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TDSunBomb extends TDNormalObject
   {
      
      public static const STATUS_FALL:uint = 1;
      
      public static const STATUS_EXPLOD:uint = 2;
      
      public static const STATUS_DISAPPEAR:uint = 3;
       
      
      public var sunData:TDNormalObjectData;
      
      public var dropTargetPoint:Point;
      
      public var status:uint;
      
      public var sunBombTrack:TDSunBombTrack;
      
      public var speed:Number;
      
      private var _sunValue:PData;
      
      private var _isBig:Boolean;
      
      public function TDSunBomb()
      {
         super();
         this.dropTargetPoint = new Point();
         this._sunValue = new PData();
         this.status = STATUS_FALL;
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
         this.sunData.init();
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         super.setLocation(param1,0);
         setAction(TDConstant.TDSunBombAction_Fall);
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
         addMouseEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addMouseEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick() : void
      {
         if(this.status == STATUS_FALL)
         {
            this.status = STATUS_EXPLOD;
            removeMouseEventListener(MouseEvent.CLICK,this.onClick);
            TDSoundCmd.playSunBombExplod();
            setAction(TDConstant.TDSunBombAction_Explod);
            CommandDispatcher.send(CommandName.TD_SunBombExplod,{"obj":this});
            this.executeDamageCaculate();
            this.destroyTrack();
         }
      }
      
      private function onRollOver() : void
      {
         setButtonMode(true);
      }
      
      private function onRollOut() : void
      {
         setButtonMode(false);
      }
      
      private function executeDamageCaculate() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:uint = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:Number = NaN;
         var _loc7_:Vector.<IGameObject> = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:BasicZombie = null;
         var _loc12_:BasicPlant = null;
         var _loc13_:TDNormalObject = null;
         var _loc14_:IGameObject = null;
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(this.x,this.y);
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.rect.width;
            _loc3_ = _loc1_.rect.height;
            _loc4_ = objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_SunBombDamageRange);
            _loc5_ = new Rectangle(this.x - _loc4_ * _loc2_ * 0.5,this.y - _loc4_ * _loc3_ * 0.5,_loc4_ * _loc2_,_loc4_ * _loc3_);
            _loc6_ = objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_SunBombDamage);
            _loc7_ = new Vector.<IGameObject>();
            _loc8_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
            _loc9_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            _loc10_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
            for each(_loc11_ in _loc8_)
            {
               if(_loc11_.x < _loc5_.x + _loc5_.width && _loc11_.x >= _loc5_.x && _loc11_.y < _loc5_.y + _loc5_.height && _loc11_.y >= _loc5_.y)
               {
                  _loc7_.push(_loc11_);
               }
            }
            for each(_loc12_ in _loc9_)
            {
               if(_loc12_.x < _loc5_.x + _loc5_.width && _loc12_.x >= _loc5_.x && _loc12_.y < _loc5_.y + _loc5_.height && _loc12_.y >= _loc5_.y)
               {
                  _loc7_.push(_loc12_);
               }
            }
            for each(_loc13_ in _loc10_)
            {
               if(_loc13_.objData.objectStaticInfo.beAttack == 1 && _loc13_.objData.isVaild && _loc13_.x < _loc5_.x + _loc5_.width && _loc13_.x >= _loc5_.x && _loc13_.y < _loc5_.y + _loc5_.height && _loc13_.y >= _loc5_.y)
               {
                  _loc7_.push(_loc13_);
               }
            }
            for each(_loc14_ in _loc7_)
            {
               TDDamageCaculete.executeDamage(_loc14_,0 - int(_loc6_),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,this);
            }
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         removeMouseEventListener(MouseEvent.CLICK,this.onClick);
         super.dispose();
      }
      
      private function destroyTrack() : void
      {
         if(this.sunBombTrack)
         {
            this.sunBombTrack.disappear();
         }
      }
      
      public function exchangeToNormalSun() : void
      {
         var _loc1_:TDNormalObjectStaticInfo = null;
         if(this._isBig)
         {
            _loc1_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,TDConstant.UnitType_BigSun,TDNormalObjectStaticInfo);
         }
         else
         {
            _loc1_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,TDConstant.UnitType_Sun,TDNormalObjectStaticInfo);
         }
         var _loc2_:Object = new Object();
         _loc2_.type = TDConstant.UnitType_Sun;
         var _loc3_:int = x;
         var _loc4_:int = y;
         var _loc5_:int = x;
         var _loc6_:int = y + Math.random() * _loc1_.getParam(TDConstant.NormalObj_Param_SunDropRandomRandomTargetY);
         if(this._isBig)
         {
            TDGameObjectCmd.generateSun(TDConstant.UnitType_BigSun,_loc3_,_loc4_,_loc3_,_loc6_);
         }
         else
         {
            TDGameObjectCmd.generateSun(TDConstant.UnitType_Sun,_loc3_,_loc4_,_loc3_,_loc6_);
         }
         this.destroyTrack();
         this.sunBombTrack = null;
         this.dispose();
      }
   }
}

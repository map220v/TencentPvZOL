package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.TDBulletStaticInfo;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   
   public class BasicBulletActionRunning extends BasicBulletAction
   {
       
      
      protected var _shooter:IGameObject;
      
      protected var _shooterStaticData:ITDStaticData;
      
      protected var _targetRoadIndex:int;
      
      protected var _targetCurSpeed:Number;
      
      protected var _targetY:Number;
      
      protected var _lastUpdateTime:Number;
      
      protected var _pastTime:Number;
      
      public function BasicBulletActionRunning()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.initBulletState();
         if((_bullet.bulletData.staticInfo as TDBulletStaticInfo).needShade)
         {
            TDShadowManager.instance.addShadowByTDGameObject(_bullet,0.5,0.5);
         }
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         this._pastTime = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         this.updateBulletPos();
         this.updateBulletState();
      }
      
      protected function getFireTarget() : IGameObject
      {
         return null;
      }
      
      protected function initBulletState() : void
      {
         this._shooter = _bullet.shooter;
         if(_bullet.target != null && _bullet.target.objectModel != null)
         {
            this._targetRoadIndex = _bullet.target.objectModel.roadIndex;
            this._targetCurSpeed = _bullet.target.getCurSpeed();
            this._targetY = _bullet.target.y;
         }
         else
         {
            this._targetRoadIndex = -1;
         }
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         var _loc1_:Array = _bullet.animation.getAllLabelName();
         if(_loc1_.length > 0)
         {
            _bullet.animation.gotoAndPlay(_loc1_[0],true);
         }
         else
         {
            _bullet.animation.play(0);
         }
      }
      
      protected function updateBulletPos() : void
      {
      }
      
      protected function updateBulletState() : void
      {
      }
      
      protected function doBulletBoom(param1:IGameObject = null, param2:Array = null) : void
      {
         var _loc3_:Boolean = TDSearchTargetUtils.bulletBounce(_bullet,param1);
         if(_loc3_)
         {
            return;
         }
         var _loc4_:Array = [];
         if(param1)
         {
            _loc4_[TDConstant.ActionParam_Target] = param1;
         }
         if(param2)
         {
            _loc4_[TDConstant.ActionParam_BulletBoomArea] = param2;
         }
         var _loc5_:String;
         if((_loc5_ = _bullet.bulletData.bulletStaticInfo.boomAction) == "" || _loc5_ == null)
         {
            _loc5_ = TDConstant.BAction_BOOM;
         }
         _bullet.setAction(_loc5_,_loc4_);
      }
      
      override public function dispose() : void
      {
         this._shooter = null;
         super.dispose();
      }
   }
}

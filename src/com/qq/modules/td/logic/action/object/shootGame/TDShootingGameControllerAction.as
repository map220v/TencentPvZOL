package com.qq.modules.td.logic.action.object.shootGame
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDShootingGameConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameShootingData;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TDShootingGameControllerAction extends BasicAction
   {
       
      
      private var _isSaving:Boolean = false;
      
      private var _powerValue:uint = 1;
      
      private var _lastUpdateTime:int;
      
      private var _boxer:IGameObject;
      
      private var _clickTipMc:MovieClip;
      
      private var _powerSlot:MovieClip;
      
      private var _timebarMask:Sprite;
      
      private var _keyCode:String;
      
      private var _maxWidth:int;
      
      private var _isCanFire:Boolean;
      
      public function TDShootingGameControllerAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:TDUnitInitVO = null;
         var _loc5_:TDMapTileData = null;
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._keyCode = _loc2_.keyCode.@value;
            _loc3_ = _loc2_.plantType.@value;
            (_loc4_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Plant,_loc3_);
            _loc5_ = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
            _loc4_.setPosByColRow(_loc5_.roadCol,_loc5_.roadRow);
            TDGameObjectCmd.addGameObjectByTDUnitInitVO(_loc4_);
            this._boxer = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            this._boxer.setAction(TDConstant.PlantAction_Idle);
            this._boxer.setFrozenAI(true);
         }
         this.initClickTipMc();
         GameGloble.resizeHelper.addListener(this.checkSize);
      }
      
      private function initClickTipMc() : void
      {
         this._clickTipMc = AssetManager.instance.GetNewClass("TDUI_ShootingGameClickTipMc") as MovieClip;
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.x = -50;
         _loc1_.text = StringUtil.substitute(FontHKHB.TD_ShootGame_ClickTip,this._keyCode);
         _loc1_.styleName = ".TXT_HKHB_13_Blue";
         this._clickTipMc.addChild(_loc1_);
         this._powerSlot = this._clickTipMc["power_slot"] as MovieClip;
         this._powerSlot.stop();
         this._powerSlot.visible = false;
         var _loc2_:Sprite = this._powerSlot["bar_mc"] as Sprite;
         this._maxWidth = _loc2_.width;
         this._timebarMask = new Sprite();
         this._timebarMask.x = -this._maxWidth;
         this._timebarMask.y = _loc2_.y;
         GraphicsUtils.drawRect(this._timebarMask,0,0,this._maxWidth,_loc2_.height,0,1);
         this._powerSlot.addChild(this._timebarMask);
         _loc2_.mask = this._timebarMask;
         TDUILayerManager.effectLayer.addChild(this._clickTipMc);
         this.isCanFire = true;
         this._clickTipMc.addEventListener(MouseEvent.CLICK,this.onInteract);
         GameGloble.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      override public function leaveState() : void
      {
         GameGloble.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this._boxer = null;
         if(this._clickTipMc != null)
         {
            this._clickTipMc.stop();
            UtilsManager.removeFromContainer(this._clickTipMc);
            this._clickTipMc.removeEventListener(MouseEvent.CLICK,this.onInteract);
            this._clickTipMc = null;
         }
         GameGloble.resizeHelper.removeListener(this.checkSize);
         super.leaveState();
      }
      
      public function checkSize(param1:Number, param2:int, param3:int) : void
      {
         var _loc4_:Point = new Point();
         _loc4_ = this._boxer.frontLayer.localToGlobal(_loc4_);
         _loc4_ = TDUILayerManager.effectLayer.globalToLocal(_loc4_);
         _loc4_.x *= GameGloble.scaleCurrent;
         _loc4_.y *= GameGloble.scaleCurrent;
         this._clickTipMc.x = _loc4_.x;
         this._clickTipMc.y = _loc4_.y;
         if(this._clickTipMc.clickArea != null)
         {
            this._clickTipMc.clickArea.scaleX = this._clickTipMc.clickArea.scaleY = GameGloble.scaleCurrent;
         }
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = 0;
         super.runningState();
         if(this._isSaving)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(this._lastUpdateTime + TDShootingGameConstant.POWER_INCREASE_TIME_INTERVAL < _loc1_)
            {
               this._lastUpdateTime = _loc1_;
               this.powerValue = this._powerValue + 1;
            }
         }
         else if(this._boxer.getActionID() == TDConstant.TDShootingGameSleepAction && ReqPlantDurationExpire.calculate(this._boxer))
         {
            this._boxer.setAction(TDConstant.TDShootingGameWakeUpAction);
            this.isCanFire = true;
         }
         if(!this._boxer.isVaild)
         {
            _gameObject.dispose();
         }
      }
      
      private function set isCanFire(param1:Boolean) : void
      {
         this._isCanFire = param1;
         this._clickTipMc.buttonMode = this._isCanFire;
      }
      
      private function set powerValue(param1:int) : void
      {
         this._powerValue = param1;
         if(this._powerValue > TDShootingGameConstant.MAX_SHOOT_POWER)
         {
            this._powerValue = 1;
         }
         this._timebarMask.x = -this._maxWidth + this._maxWidth * this._powerValue / TDShootingGameConstant.MAX_SHOOT_POWER;
      }
      
      private function onInteract(param1:Event = null) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         if(this._isSaving)
         {
            this.doShoot();
         }
         else if(this._isCanFire)
         {
            this.doSavePower();
         }
      }
      
      private function doSavePower() : void
      {
         this._isSaving = true;
         this.powerValue = 1;
         this._powerSlot.visible = true;
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         this._boxer.setAction(TDConstant.TDShootingGamePowerSavingAction);
      }
      
      private function doShoot() : void
      {
         this.isCanFire = false;
         this._isSaving = false;
         this._powerSlot.visible = false;
         var _loc1_:Point = new Point(this._boxer.x + this._powerValue * (1 + TDMiniGameShootingData.getInstance().windForce * 0.1) * 72,this._boxer.y);
         this._boxer.setAction(TDConstant.TDShootingGameFireAction,[_loc1_]);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:String = String.fromCharCode(param1.keyCode);
         if(String.fromCharCode(param1.keyCode) == this._keyCode)
         {
            this.onInteract();
         }
      }
   }
}

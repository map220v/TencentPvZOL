package com.qq.modules.td.logic.action.object.effect
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TDMusicGameBoxerEffectAction extends BasicAction
   {
       
      
      private var _boxer:IGameObject;
      
      private var _clickTipMc:MovieClip;
      
      private var _keyCode:int;
      
      public function TDMusicGameBoxerEffectAction()
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
            _loc3_ = _loc2_.plantType.@value;
            (_loc4_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Plant,_loc3_);
            _loc5_ = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
            _loc4_.setPosByColRow(_loc5_.roadCol,_loc5_.roadRow);
            TDGameObjectCmd.addGameObjectByTDUnitInitVO(_loc4_);
            this._boxer = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            this._boxer.setAction(TDConstant.TDMusicGameBoxerActionIdle);
            this._boxer.setFrozenAI(true);
            this._boxer.setRunningProp(TDConstant.GameObject_Prop_MusicGame_Boxer_isCoolDown,0);
         }
         this.initClickTipMc();
         GameGloble.resizeHelper.addListener(this.checkSize);
      }
      
      private function initClickTipMc() : void
      {
         var _loc1_:Label = null;
         _loc1_ = new Label();
         _loc1_.x = -20;
         _loc1_.text = FontHKHB.TD_MusicGame_ClickMouse;
         _loc1_.styleName = ".TXT_HKHB_13_Blue";
         this._clickTipMc = AssetManager.instance.GetNewClass("TDUI_MusicGameClickTipMc") as MovieClip;
         this._clickTipMc.addChild(_loc1_);
         this._clickTipMc.buttonMode = true;
         TDUILayerManager.effectLayer.addChild(this._clickTipMc);
         this._clickTipMc.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc2_:Array = [81,87,69];
         if(_loc2_[_gameObject.objectModel.roadIndex - 2] != null)
         {
            this._keyCode = _loc2_[_gameObject.objectModel.roadIndex - 2];
            GameGloble.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
      }
      
      override public function leaveState() : void
      {
         GameGloble.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this._boxer = null;
         if(this._clickTipMc != null)
         {
            this._clickTipMc.stop();
            UtilsManager.removeFromContainer(this._clickTipMc);
            this._clickTipMc.removeEventListener(MouseEvent.CLICK,this.onClick);
            this._clickTipMc = null;
         }
         GameGloble.resizeHelper.removeListener(this.checkSize);
         super.leaveState();
      }
      
      public function checkSize(param1:Number, param2:int, param3:int) : void
      {
         var _loc4_:Point = new Point(-7,20);
         _loc4_ = this._boxer.frontLayer.localToGlobal(_loc4_);
         _loc4_ = TDUILayerManager.effectLayer.globalToLocal(_loc4_);
         this._clickTipMc.x = _loc4_.x * GameGloble.scaleCurrent;
         this._clickTipMc.y = (_loc4_.y - this._clickTipMc.height) * GameGloble.scaleCurrent;
         if(this._clickTipMc.clickArea != null)
         {
            this._clickTipMc.clickArea.scaleX = this._clickTipMc.clickArea.scaleY = GameGloble.scaleCurrent;
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(!this._boxer.isVaild)
         {
            _gameObject.dispose();
         }
      }
      
      private function onClick(param1:Event) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         if(this._boxer.getRunningProp(TDConstant.GameObject_Prop_MusicGame_Boxer_isCoolDown) == 0)
         {
            this._boxer.setRunningProp(TDConstant.GameObject_Prop_MusicGame_Boxer_isCoolDown,1);
            this._boxer.setAction(TDConstant.TDMusicGameBoxerActionFight);
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == this._keyCode)
         {
            this.onClick(null);
         }
      }
   }
}

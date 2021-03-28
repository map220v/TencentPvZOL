package com.qq.modules.td.logic.action.object.coconutGame
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
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
   
   public class TDCoconutControllerAction extends BasicAction
   {
       
      
      private var _boxer:IGameObject;
      
      private var _clickTipMc:MovieClip;
      
      private var _keyCode:String;
      
      private var _isCanFire:Boolean;
      
      public function TDCoconutControllerAction()
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
            this._boxer.setFrozenAI(true);
            ExeDoAction.calculateStatic(this._boxer,TDConstant.PCoconutCannonAction_Idle);
         }
         this.initClickTipMc();
         GameGloble.resizeHelper.addListener(this.checkSize);
      }
      
      private function initClickTipMc() : void
      {
         var _loc1_:Label = null;
         this._clickTipMc = AssetManager.instance.GetNewClass("TDUI_CoconutGameClickTipMc") as MovieClip;
         _loc1_ = new Label();
         _loc1_.width = 100;
         _loc1_.x = -50;
         _loc1_.text = StringUtil.substitute(FontHKHB.TD_ShootGame_ClickTip,this._keyCode);
         _loc1_.styleName = ".TXT_HKHB_13_Blue";
         this._clickTipMc.addChild(_loc1_);
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
         super.runningState();
         var _loc1_:Boolean = this._boxer.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping);
         if(_loc1_)
         {
            if(ReqPlantDurationExpire.calculate(this._boxer))
            {
               ExeDoAction.calculateStatic(this._boxer,TDConstant.PlantAction_WakeUp);
            }
            else
            {
               ExeDoAction.calculateStatic(this._boxer,TDConstant.PlantAction_Sleep);
            }
         }
         else if(ReqPlantCurAction.calculate(this._boxer,false,TDConstant.PCoconutCannonAction_Shoot))
         {
            ExeDoAction.calculateStatic(this._boxer,TDConstant.PCoconutCannonAction_Idle);
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
      
      private function onInteract(param1:Event = null) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         if(ReqCurAction.calculate(this._boxer,true,TDConstant.PCoconutCannonAction_Idle))
         {
            ExeDoAction.calculateStatic(this._boxer,TDConstant.PCoconutCannonAction_Shoot);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         var _loc2_:String = String.fromCharCode(param1.keyCode);
         if(String.fromCharCode(param1.keyCode) == this._keyCode)
         {
            if(ReqCurAction.calculate(this._boxer,true,TDConstant.PCoconutCannonAction_Idle))
            {
               ExeDoAction.calculateStatic(this._boxer,TDConstant.PCoconutCannonAction_Shoot);
            }
         }
      }
   }
}

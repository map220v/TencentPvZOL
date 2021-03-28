package com.qq.modules.td.logic.action.object.effect
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.StateMachine;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   
   public class TDSkillSummonZombieAction extends BasicAction
   {
      
      private static const RaiseZombie:String = "RaiseZombie";
      
      private static const SleepZombie:String = "SleepZombie";
       
      
      private var _summonObject:IGameObject;
      
      private var _raisePosY:int;
      
      private var _lastTime:Number;
      
      private var _stateMachine:StateMachine;
      
      private var _clickTipMc:MovieClip;
      
      private var _cursor:MovieClip;
      
      public function TDSkillSummonZombieAction()
      {
         super();
         this._stateMachine = new StateMachine();
         this._stateMachine.addState(RaiseZombie,this.enterRaiseZombie,this.runningRaiseZombie,this.leaveRaiseZombie);
         this._stateMachine.addState(SleepZombie,this.enterSleepZombie,this.runningSleepZombie);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("tomb_dirt_anim");
         this._stateMachine.setState(RaiseZombie);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(this._summonObject != null && this._summonObject.isVaild)
         {
            this._stateMachine.doRunningFunc();
         }
         else
         {
            _gameObject.dispose();
         }
      }
      
      override public function leaveState() : void
      {
         if(this._summonObject != null)
         {
            this._summonObject = null;
         }
         if(this._stateMachine != null)
         {
            this._stateMachine.clean();
            this._stateMachine = null;
         }
         this.cleanClickTip();
         this._cursor = null;
         super.leaveState();
      }
      
      private function cleanClickTip() : void
      {
         if(this._clickTipMc != null)
         {
            this._clickTipMc.stop();
            UtilsManager.removeFromContainer(this._clickTipMc);
            this.onRollOut(null);
            this._clickTipMc.removeEventListener(MouseEvent.CLICK,this.onClick);
            this._clickTipMc.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this._clickTipMc.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
            this._clickTipMc.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this._clickTipMc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this._clickTipMc = null;
         }
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:BasicZombie = this._summonObject as BasicZombie;
         if(_loc2_ != null)
         {
            if(_loc2_.zombieData.isExistArmor())
            {
               if(_loc2_.zombieData.getAllArmorCurHp() > 1000)
               {
                  _loc3_ = -(_loc2_.zombieData.getAllArmorMaxHp() * 0.5 + 10);
               }
               else
               {
                  _loc3_ = -(_loc2_.zombieData.getAllArmorMaxHp() + 10);
               }
            }
            else
            {
               _loc3_ = -(_loc2_.zombieData.curHp.get() + 10);
            }
            TDDamageCaculete.executeDamage(_loc2_,_loc3_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Skill,null);
         }
      }
      
      private function onRollOver(param1:Event) : void
      {
         Mouse.hide();
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(this._cursor == null)
         {
            this._cursor = AssetManager.instance.GetNewClass("TD_UI_HammerCursor") as MovieClip;
            this._cursor.gotoAndStop("up");
         }
         TDUILayerManager.topEffectLayer.dragSp.addChild(this._cursor);
      }
      
      private function onRollOut(param1:Event) : void
      {
         Mouse.show();
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(this._cursor != null)
         {
            UtilsManager.removeFromContainer(this._cursor);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this._cursor.x = GameGloble.stage.mouseX;
         this._cursor.y = GameGloble.stage.mouseY;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(this._cursor)
         {
            this._cursor.gotoAndStop("down");
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(this._cursor)
         {
            this._cursor.gotoAndStop("up");
         }
      }
      
      private function enterRaiseZombie(param1:Array = null) : void
      {
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:TDUnitInitVO = new TDUnitInitVO();
         var _loc3_:int = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Type);
         var _loc4_:int = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_row);
         var _loc5_:int = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_col);
         _loc2_.init(TDConstant.UnitCatalog_Zombie,_loc3_);
         _loc2_.setPosByColRow(_loc5_,_loc4_);
         TDGameObjectCmd.addGameObjectByTDUnitInitVO(_loc2_);
         this._summonObject = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
         this._summonObject.setAction(TDConstant.ZAction_Idle);
         this._summonObject.animation.stop();
         this._summonObject.setShadeVisible(false);
         this._summonObject.setFrozenAI(true);
         var _loc6_:Rectangle = this._summonObject.animation.GetBounds();
         this._summonObject.scrollRect = new Rectangle(_loc6_.x,_loc6_.y,this._summonObject.contentW,_loc6_.height);
         this._raisePosY = this._summonObject.animation.display.y;
         this._summonObject.animation.display.y += this._summonObject.contentH;
         this._summonObject.objectModel.addBuff(TDConstant.TDBuffID_God,this._summonObject);
         var _loc7_:Boolean;
         if(_loc7_ = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_IsCanClick))
         {
            this.initClickTipMc();
         }
      }
      
      private function initClickTipMc() : void
      {
         this._clickTipMc = AssetManager.instance.GetNewClass("TDUI_ClickTipMc") as MovieClip;
         var _loc1_:Label = new Label();
         _loc1_.text = FontHKHB.TD_ClickMouse_NotStop;
         _loc1_.styleName = ".TXT_HKHB_13_Blue";
         _loc1_.width = 100;
         this._clickTipMc.addChild(_loc1_);
         var _loc2_:Point = new Point(0,0);
         _loc2_ = this._summonObject.frontLayer.localToGlobal(_loc2_);
         var _loc3_:Sprite = new Sprite();
         GraphicsUtils.drawRect(_loc3_,0,0,this._summonObject.damageArea.width,this._summonObject.damageArea.height,0,0);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         _loc2_.x *= GameGloble.scaleCurrent;
         _loc2_.y *= GameGloble.scaleCurrent;
         this._clickTipMc.x = _loc2_.x - this._summonObject.damageArea.width * 0.5;
         this._clickTipMc.y = _loc2_.y - this._summonObject.damageArea.height;
         _loc3_.buttonMode = true;
         this._clickTipMc.addChild(_loc3_);
         this._clickTipMc.hitArea = _loc3_;
         TDUILayerManager.effectLayer.addChild(this._clickTipMc);
         this._clickTipMc.addEventListener(MouseEvent.CLICK,this.onClick);
         this._clickTipMc.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this._clickTipMc.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this._clickTipMc.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._clickTipMc.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function runningRaiseZombie(param1:Array = null) : void
      {
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(this._summonObject.scrollRect != null)
         {
            if(this._summonObject.animation.display.y > this._raisePosY)
            {
               if(_loc2_ - this._lastTime > 35)
               {
                  this._summonObject.animation.display.y -= 2;
                  this._lastTime = _loc2_;
               }
            }
            else
            {
               this._stateMachine.setState(SleepZombie);
            }
         }
         if(this._summonObject != null && !this._summonObject.objectModel.isAlive())
         {
            this.cleanClickTip();
         }
      }
      
      private function leaveRaiseZombie(param1:Array = null) : void
      {
         if(this._summonObject != null)
         {
            this._summonObject.animation.display.y = this._raisePosY;
            this._summonObject.scrollRect = null;
            this._summonObject.setShadeVisible(true);
         }
      }
      
      private function enterSleepZombie(param1:Array = null) : void
      {
         _gameObject.animation.visible = false;
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         if(this._summonObject.isVaild)
         {
            this._summonObject.objectModel.removeBuff(TDConstant.TDBuffID_God);
            this._summonObject.setFrozenAI(false);
         }
      }
      
      private function runningSleepZombie(param1:Array = null) : void
      {
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc2_ - this._lastTime > 1000)
         {
            _gameObject.dispose();
         }
      }
   }
}

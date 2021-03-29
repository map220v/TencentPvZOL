package com.qq.modules.td.logic.unit.basic
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.core.Application;
   import asgui.utils.WorldClock;
   import com.greensock.TweenMax;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.TDBulletStaticInfo;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.IAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import com.qq.modules.td.view.game.ui.TDHpBar;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.StateMachine;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class GameObject extends EventDispatcher implements IGameObject
   {
       
      
      public var model:TDGameObjectData;
      
      protected var _damageArea:Rectangle;
      
      protected var _attackArea:Rectangle;
      
      protected var _explodeEffectArea:Rectangle;
      
      protected var _curStaticTimeScale:Number;
      
      protected var _resFrameRate:int;
      
      protected var _frontLayer:Object;
      
      protected var _clip:IBlitClip;
      
      protected var _stateMachine:StateMachine;
      
      private var _curAttackTarget:IGameObject;
      
      public var timeRecordMap:Dictionary;
      
      protected var _isVaild:Boolean;
      
      protected var _isSleep:Boolean;
      
      private var _isUpdate:Boolean;
      
      private var _uid:uint;
      
      protected var _animation:GameObjectAnimation;
      
      private var _lastUpdateAreaFrame:int = -1;
      
      private var _isFrozenAI:Boolean = false;
      
      private var _curActionID:String;
      
      protected var _shade:IBlitClip;
      
      private var _hasDisposed:Boolean;
      
      private var _isStarlingMouseOver:Boolean = false;
      
      private var _checkRect:Rectangle;
      
      private var _checkPoint:Point;
      
      private var _inlineMouseEventMap:Dictionary;
      
      private var _outsideMouseEventMap:Dictionary;
      
      private var _curFilterType:int = 0;
      
      private var _filterPriority:int;
      
      private var _aipropList:Array;
      
      private var _runningPropList:Array;
      
      private var _mask:Shape;
      
      private var _hpHideTime:Number = 0;
      
      private var _isShowHpBar:Boolean = false;
      
      protected var _hpBar:TDHpBar;
      
      private var _needHpBar:int = -1;
      
      public function GameObject()
      {
         super();
         this.uid = TDFactory.getNextUnitUin();
         this._damageArea = new Rectangle();
         this._attackArea = new Rectangle();
         this._explodeEffectArea = new Rectangle();
         this.timeRecordMap = new Dictionary();
         this._isUpdate = true;
         this._resFrameRate = -1;
         this._frontLayer = new Sprite();
      }
      
      public function get uid() : uint
      {
         return this._uid;
      }
      
      public function set uid(param1:uint) : void
      {
         this._uid = param1;
      }
      
      public function get frontLayer() : Object
      {
         return this._frontLayer;
      }
      
      public function get animation() : GameObjectAnimation
      {
         return this._animation;
      }
      
      protected function updateAreaInfo() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         if(this._attackArea == null)
         {
            this._attackArea = new Rectangle();
         }
         if(this._damageArea == null)
         {
            this._damageArea = new Rectangle();
         }
         if(this.animation != null)
         {
            if(this._lastUpdateAreaFrame != this.animation.getCurrentFrameIndex())
            {
               this._lastUpdateAreaFrame = this.animation.getCurrentFrameIndex();
               if(this.animation.animationData != null)
               {
                  _loc1_ = this.animation.animationData.getAttackAreaByFrame(this._lastUpdateAreaFrame);
                  _loc2_ = this.animation.animationData.getDamageAreaByFrame(this._lastUpdateAreaFrame);
                  this._attackArea.x = _loc1_[0];
                  this._attackArea.y = _loc1_[1];
                  this._attackArea.width = _loc1_[2];
                  this._attackArea.height = _loc1_[3];
                  this._damageArea.x = _loc2_[0];
                  this._damageArea.y = _loc2_[1];
                  this._damageArea.width = _loc2_[2];
                  this._damageArea.height = _loc2_[3];
               }
            }
         }
      }
      
      public function get damageArea() : Rectangle
      {
         this.updateAreaInfo();
         return this._damageArea;
      }
      
      public function get attackArea() : Rectangle
      {
         this.updateAreaInfo();
         return this._attackArea;
      }
      
      public function set damageArea(param1:Rectangle) : void
      {
         this._damageArea = param1;
      }
      
      public function set attackArea(param1:Rectangle) : void
      {
         this._attackArea = param1;
      }
      
      public function get explodeEffectArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         if(this.damageArea == null)
         {
            return _loc1_;
         }
         _loc1_.x = this.x + this.damageArea.x;
         _loc1_.y = this.y + this.damageArea.y + this.damageArea.height;
         _loc1_.width = this.damageArea.width;
         _loc1_.height = 1;
         return _loc1_;
      }
      
      public function getFireBonePos(param1:String) : Point
      {
         var _loc2_:Point = null;
         var _loc3_:IBlitDisplayObject = null;
         var _loc4_:Point = null;
         if(this.animation)
         {
            _loc3_ = this.animation.getBoneClone(param1);
         }
         if(_loc3_ != null)
         {
            _loc2_ = new Point();
            _loc3_.x += this.animation.bone.asset.x;
            _loc3_.y += this.animation.bone.asset.y;
            this.frontLayer.addChild(_loc3_.asset);
            _loc4_ = this.getBoneDisplayPos(_loc3_);
            _loc2_.x = _loc4_.x + this.model.staticInfo.firePosOffsetX + TDConstant.passWarfieldPosX;
            _loc2_.y = _loc4_.y + this.model.staticInfo.firePosOffsetY;
            this.frontLayer.removeChild(_loc3_.asset);
            _loc3_.Dispose();
         }
         return _loc2_;
      }
      
      public function get timeScale() : Number
      {
         if(this.animation != null)
         {
            return this.animation.timeScale;
         }
         return this._curStaticTimeScale * TDGameInfo.speedRatio;
      }
      
      public function get curAttackTarget() : IGameObject
      {
         return this._curAttackTarget;
      }
      
      public function setAttackTarget(param1:IGameObject) : void
      {
         this._curAttackTarget = param1;
      }
      
      public function cleanAttackTarget() : void
      {
         this._curAttackTarget = null;
      }
      
      public function get isVaild() : Boolean
      {
         return this._isVaild;
      }
      
      public function set isVaild(param1:Boolean) : void
      {
         this._isVaild = param1;
      }
      
      public function get isSleep() : Boolean
      {
         return this._isSleep;
      }
      
      public function set isSleep(param1:Boolean) : void
      {
         this._isSleep = param1;
      }
      
      public function get x() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.x;
      }
      
      public function set x(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.x = param1;
      }
      
      public function get y() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.y;
      }
      
      public function set y(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.y = param1;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.scaleX = param1;
      }
      
      public function get scaleX() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.scaleX;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.scaleY = param1;
      }
      
      public function get scaleY() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.scaleY;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.alpha = param1;
      }
      
      public function get alpha() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.alpha;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(this.frontLayer == null)
         {
            return;
         }
         this.frontLayer.rotation = param1;
      }
      
      public function get rotation() : Number
      {
         if(this.frontLayer == null)
         {
            return 0;
         }
         return this.frontLayer.rotation;
      }
      
      public function get objectModel() : TDGameObjectData
      {
         return this.model;
      }
      
      public function get isUpdate() : Boolean
      {
         return this._isUpdate;
      }
      
      public function set isUpdate(param1:Boolean) : void
      {
         this._isUpdate = param1;
      }
      
      public function setData(param1:TDGameObjectData) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("设置塔防对象数据为空");
         }
         this.model = param1;
         this.model.gameObject = this;
         this.model.uid = this.uid;
         this._isVaild = true;
         this.model.init();
      }
      
      public function setVaild(param1:Boolean) : void
      {
         this._isVaild = param1;
         this.model.isVaild = param1;
      }
      
      public function setTimeRecord(param1:int, param2:Number) : void
      {
         this.timeRecordMap[param1] = param2;
      }
      
      public function getTimeRecord(param1:int) : Number
      {
         if(this.timeRecordMap[param1] == null)
         {
            this.timeRecordMap[param1] = TDGameInfo.getInstance().getCurGameTime();
         }
         return this.timeRecordMap[param1];
      }
      
      public function setFrozenAI(param1:Boolean) : void
      {
         this._isFrozenAI = param1;
         BehaviourTreeCenter.instance.setLock(this.uid,param1);
      }
      
      public function isFrozenAI() : Boolean
      {
         return this._isFrozenAI;
      }
      
      public function init(param1:Boolean = false, param2:Boolean = false) : void
      {
         this.initAnmi(param1,param2);
         this._stateMachine = new StateMachine();
         this.frontLayer.addEventListener(Event.ADDED,this.onAddToStage);
         this.initListener();
      }
      
      protected function initAnmi(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc4_:BlitBoneAnim = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         if(this.model == null)
         {
            return;
         }
         if(param1 && !(this._frontLayer is Sprite))
         {
            this._frontLayer = new Sprite();
         }
         var _loc3_:Number = 1;
         var _loc5_:int = this.model["staticInfo"].isBlit;
         switch(this.objectModel.unitCatalog)
         {
            case TDConstant.UnitCatalog_Bullet:
               _loc6_ = UrlManager.Url_TDBulletAnmi;
               break;
            case TDConstant.UnitCatalog_Zombie:
               _loc6_ = UrlManager.Url_TDZombieAnmi;
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc6_ = UrlManager.Url_TDPlantAnmi;
               break;
            default:
               _loc6_ = UrlManager.Url_TDObjectAnmi;
         }
         if(this.model.staticInfo.resFileName.length > 0)
         {
            _loc7_ = UrlManager.getUrl(_loc6_,this.model.staticInfo.resFileName + "." + GameGloble.BONE_FILE_EXT);
         }
         this._animation = new GameObjectAnimation(this.frontLayer,_loc7_,1,param1,param2);
         this._animation.frameRate = this.model.staticInfo.frameRate;
      }
      
      protected function initListener() : void
      {
         this.setMouseEnable(false);
      }
      
      protected function addAction(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IAction = TDFactory.createAction(param1,this);
         if(_loc3_ != null)
         {
            this._stateMachine.addState(param1,_loc3_.enterState,_loc3_.update,_loc3_.leaveState,_loc3_.dispose,param2);
         }
         else
         {
            getLogger("TD").debug("添加未知动作" + param1);
         }
      }
      
      public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         if(this._stateMachine == null)
         {
            return;
         }
         if(param1 == "" || param1 == null)
         {
            this._curActionID = param1;
            return;
         }
         if(this._resFrameRate == -1)
         {
            this._resFrameRate = Application.application.stage.frameRate;
         }
         this.setTimeScale(1);
         this.switchAction(param1,param2,param3);
      }
      
      public function switchAction(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         if(!this._stateMachine.hasState(param1))
         {
            this.addAction(param1);
         }
         this._curActionID = param1;
         this._stateMachine.setState(param1,param2,param3);
      }
      
      public function getActionID() : String
      {
         return this._curActionID;
      }
      
      public function getAllActionIDList() : Array
      {
         if(this._stateMachine)
         {
            return this._stateMachine.stateList;
         }
         return [];
      }
      
      protected function startTimeRecord() : void
      {
      }
      
      public function start() : void
      {
      }
      
      public function update() : void
      {
         if(this._stateMachine != null)
         {
            this._stateMachine.doRunningFunc();
         }
         if(this.model != null)
         {
            this.model.runBuffEffect();
         }
         this.updateHPState();
      }
      
      public function setTimeScale(param1:Number) : void
      {
         this._curStaticTimeScale = param1;
         this.updateTimeScale();
      }
      
      public function updateTimeScale() : void
      {
         if(this.animation != null)
         {
            this.animation.timeScale = this._curStaticTimeScale * TDGameInfo.speedRatio;
         }
      }
      
      public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         return false;
      }
      
      public function getBoneDisplayPos(param1:IBlitDisplayObject) : Point
      {
         var _loc2_:Point = new Point(0,0);
         if(param1 != null)
         {
            _loc2_ = param1.localToGlobal(_loc2_);
         }
         _loc2_.x += -GameGloble.xAddForUI / GameGloble.scaleCurrent;
         return _loc2_;
      }
      
      public function get needShade() : Boolean
      {
         return this.objectModel.staticInfo.isNeedShade;
      }
      
      public function get needSplash() : Boolean
      {
         var _loc1_:ITDStaticData = this.objectModel.staticInfo;
         if(_loc1_ is TDBulletStaticInfo)
         {
            return int((_loc1_ as TDBulletStaticInfo).needSplash) > 0;
         }
         if(_loc1_ is TDNormalObjectStaticInfo)
         {
            return int((_loc1_ as TDNormalObjectStaticInfo).needSplash) > 0;
         }
         return false;
      }
      
      public function addShade() : void
      {
         if(this.damageArea)
         {
            TDShadowManager.instance.addShadowByTDGameObject(this,!!this.damageArea.width ? Number(this.damageArea.width / 60) : Number(1),!!this.damageArea.height ? Number(this.damageArea.height / 100) : Number(1));
         }
         else
         {
            TDShadowManager.instance.addShadowByTDGameObject(this);
         }
      }
      
      public function setShadeVisible(param1:Boolean) : void
      {
         TDShadowManager.instance.updateShadowByTDGameObject(this,param1);
      }
      
      protected function cleanShade() : void
      {
         TDShadowManager.instance.disposeShadowByTDGameObject(this);
      }
      
      public function debug_showAreaInfo() : void
      {
         var _loc1_:Sprite = null;
         _loc1_ = this.frontLayer.getChildByName("debug_areaLayer");
         if(_loc1_ == null)
         {
            _loc1_ = new Sprite();
            _loc1_.name = "debug_areaLayer";
         }
         this.frontLayer.addChild(_loc1_);
         GraphicsUtils.cleanContainer(_loc1_);
         GraphicsUtils.drawRect(_loc1_,this.attackArea.x,this.attackArea.y,this.attackArea.width,this.attackArea.height,65280,0.4);
         GraphicsUtils.drawRect(_loc1_,this.damageArea.x,this.damageArea.y,this.damageArea.width,this.damageArea.height,16711680,0.4);
      }
      
      public function debug_hideAreaInfo() : void
      {
         var _loc1_:Sprite = this.frontLayer.getChildByName("debug_areaLayer");
         if(_loc1_ != null)
         {
            UtilsManager.removeFromContainer(_loc1_ as Sprite);
         }
      }
      
      protected function onAddToStage(param1:Event) : void
      {
         this.frontLayer.removeEventListener(Event.ADDED,this.onAddToStage);
         this.start();
      }
      
      public function setLocation(param1:Number, param2:Number) : void
      {
         this.frontLayer.x = param1;
         this.frontLayer.y = param2;
         TDShadowManager.instance.updateShadowByTDGameObject(this);
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this.dispose();
      }
      
      public function dispose(param1:Boolean = true) : void
      {
         this.cleanHPBar();
         if(BehaviourTreeCenter.instance.hasAIByKey(this.uid))
         {
            BehaviourTreeCenter.instance.removeAI(this.uid);
         }
         this.removeAllFilter();
         if(param1)
         {
            TDGameInfo.getInstance().addRemoveGameObjectFromMapList(this);
         }
         WorldClock.clock.remove(this.animation);
         UtilsManager.removeFromContainer(this.frontLayer);
         TDGameInfo.getInstance().removeFromSortList(this);
         if(this._clip != null)
         {
            this._clip.Dispose();
            this._clip = null;
         }
         if(this._stateMachine != null)
         {
            this._stateMachine.clean();
         }
         if(this._curAttackTarget != null)
         {
            this._curAttackTarget = null;
         }
         if(this._animation != null)
         {
            this._animation.cleanFilter();
            this._animation.Dispose();
            this._animation = null;
         }
         if(this._stateMachine != null)
         {
            this._stateMachine = null;
         }
         this.cleanShade();
         this.cleanInitInlineMouseEvent();
         this._isVaild = false;
         this.model.isVaild = false;
         if(this.model != null)
         {
            this.model.dispose();
         }
         this._hasDisposed = true;
      }
      
      public function setVisible(param1:Boolean) : void
      {
         this.frontLayer.visible = param1;
      }
      
      public function setButtonMode(param1:Boolean) : void
      {
         this.frontLayer.buttonMode = param1;
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         var _loc3_:Point = null;
         var _loc2_:Function = this._outsideMouseEventMap[param1.type];
         if(_loc2_ != null)
         {
            _loc3_ = this.getMouseXY(param1);
            if(this.isInside(_loc3_))
            {
               _loc2_();
            }
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.frontLayer.addEventListener(MouseEvent.ROLL_OUT,this.onBasicModeRollOut);
         this.frontLayer.addEventListener(MouseEvent.MOUSE_MOVE,this.onBasicModeMouseMove);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
      }
      
      private function onBasicModeRollOut(param1:MouseEvent) : void
      {
         this.frontLayer.removeEventListener(MouseEvent.ROLL_OUT,this.onBasicModeRollOut);
         this.frontLayer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBasicModeMouseMove);
      }
      
      private function onBasicModeMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Function = null;
         if(this._checkPoint == null)
         {
            this._checkPoint = new Point();
         }
         this._checkPoint.x = param1.stageX;
         this._checkPoint.y = param1.stageY;
         if(this.isInside(this._checkPoint))
         {
            this.frontLayer.removeEventListener(MouseEvent.ROLL_OUT,this.onBasicModeRollOut);
            this.frontLayer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBasicModeMouseMove);
            _loc2_ = this._outsideMouseEventMap[MouseEvent.ROLL_OVER];
            if(_loc2_ != null)
            {
               _loc2_();
            }
         }
      }
      
      private function isInside(param1:Point) : Boolean
      {
         if(this._checkRect == null)
         {
            this._checkRect = new Rectangle();
         }
         if(this.animation)
         {
            this._checkRect.x = this.x + this.animation.displayX + this.damageArea.x;
            this._checkRect.y = this.y + this.animation.displayY + this.damageArea.y;
            this._checkRect.width = this.damageArea.width;
            this._checkRect.height = this.damageArea.height;
         }
         else
         {
            this._checkRect.x = this.x + this._clip.x + this.damageArea.x;
            this._checkRect.y = this.y + this._clip.y + this.damageArea.y;
            this._checkRect.width = this._clip.width;
            this._checkRect.height = this._clip.height;
         }
         param1 = this.frontLayer.parent.globalToLocal(param1);
         return this._checkRect.containsPoint(param1);
      }
      
      private function getMouseXY(param1:MouseEvent) : Point
      {
         if(this._checkPoint == null)
         {
            this._checkPoint = new Point();
         }
         this._checkPoint.x = param1.stageX;
         this._checkPoint.y = param1.stageY;
         return this._checkPoint;
      }
      
      private function initInlineMouseEventMap() : void
      {
         this._inlineMouseEventMap = new Dictionary();
         this._inlineMouseEventMap[MouseEvent.CLICK] = this.onMouseClick;
         this._inlineMouseEventMap[MouseEvent.ROLL_OVER] = this.onMouseOver;
         this._outsideMouseEventMap = new Dictionary();
      }
      
      private function cleanInitInlineMouseEvent() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.frontLayer.removeEventListener(MouseEvent.ROLL_OUT,this.onBasicModeRollOut);
         this.frontLayer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onBasicModeMouseMove);
         for(_loc1_ in this._inlineMouseEventMap)
         {
            delete this._inlineMouseEventMap[_loc1_];
         }
         for(_loc2_ in this._outsideMouseEventMap)
         {
            delete this._outsideMouseEventMap[_loc2_];
         }
      }
      
      public function addMouseEventListener(param1:String, param2:Function) : void
      {
         if(this._inlineMouseEventMap == null)
         {
            this.initInlineMouseEventMap();
         }
         var _loc3_:Function = this._inlineMouseEventMap[param1];
         if(_loc3_ != null)
         {
            this.frontLayer.addEventListener(param1,_loc3_);
            this._outsideMouseEventMap[param1] = param2;
         }
         else
         {
            this._outsideMouseEventMap[param1] = param2;
         }
      }
      
      public function removeMouseEventListener(param1:String, param2:Function) : void
      {
         if(this._inlineMouseEventMap == null)
         {
            this.initInlineMouseEventMap();
         }
         var _loc3_:Function = this._inlineMouseEventMap[param1];
         if(_loc3_ != null)
         {
            this.frontLayer.removeEventListener(param1,_loc3_);
            delete this._outsideMouseEventMap[param1];
         }
      }
      
      public function getCurSpeed() : Number
      {
         return 0;
      }
      
      public function removeSelf() : void
      {
         UtilsManager.removeFromContainer(this.frontLayer);
      }
      
      public function hasFilter(param1:int) : Boolean
      {
         return this._curFilterType == param1;
      }
      
      public function addFilter(param1:int, param2:Object, param3:int = 0) : Boolean
      {
         if(!this._isVaild)
         {
            return false;
         }
         if(param2 == null)
         {
            return false;
         }
         if(this._curFilterType == TDConstant.TDFilter_NONE || this._filterPriority < param3)
         {
            this.animation.filter = param2;
            this._curFilterType = param1;
            this._filterPriority = param3;
            return true;
         }
         return false;
      }
      
      public function removeFilter(param1:int) : void
      {
         if(!this._isVaild)
         {
            return;
         }
         if(this._curFilterType == param1)
         {
            if(this.animation)
            {
               this.animation.cleanFilter();
               this._curFilterType = TDConstant.TDFilter_NONE;
               this._filterPriority = 0;
            }
         }
      }
      
      public function removeAllFilter() : void
      {
      }
      
      override public function toString() : String
      {
         return "[" + this.model["staticInfo"].name + "]";
      }
      
      protected function playHitEffect() : void
      {
         if(!this._isVaild)
         {
            return;
         }
         TweenMax.to(this.animation.display,0.1,{
            "colorTransform":{
               "tint":16777215,
               "tintAmount":0.3
            },
            "onComplete":this.stopHitEffct
         });
      }
      
      protected function stopHitEffct() : void
      {
         if(!this._isVaild)
         {
            return;
         }
         TweenMax.to(this.animation.display,0.1,{"colorTransform":{"tintAmount":0}});
      }
      
      protected function playFuelEffect() : void
      {
         if(!this._isVaild)
         {
            return;
         }
         TweenMax.fromTo(this.frontLayer,0.7,{"colorTransform":{"tint":null}},{
            "colorTransform":{"greenOffset":75},
            "repeat":-1,
            "yoyo":true
         });
      }
      
      protected function stopFuelEffect() : void
      {
         if(!this._isVaild)
         {
            return;
         }
         TweenMax.to(this.frontLayer,0.1,{"colorTransform":{"tintAmount":0}});
      }
      
      protected function playCarryCardEffect() : void
      {
      }
      
      protected function stopCarryCardEffect() : void
      {
      }
      
      public function setMouseEnable(param1:Boolean) : void
      {
         if(this._frontLayer != null)
         {
            this._frontLayer.mouseChildren = param1;
            this._frontLayer.mouseEnabled = param1;
         }
         if(this.animation.bone.asset)
         {
            this.animation.bone.asset.mouseEnabled = false;
         }
      }
      
      public function setAICustomProp(param1:String, param2:Boolean) : void
      {
         if(this._aipropList == null)
         {
            this._aipropList = new Array();
         }
         if(param1 == null)
         {
            return;
         }
         this._aipropList[param1] = param2;
      }
      
      public function checkAICustomProp(param1:String, param2:Boolean) : Boolean
      {
         if(this._aipropList == null)
         {
            this._aipropList = new Array();
         }
         if(!this.hasAICustomProp(param1))
         {
            return false;
         }
         return this._aipropList[param1] == param2;
      }
      
      public function hasAICustomProp(param1:String) : Boolean
      {
         if(this._aipropList == null)
         {
            this._aipropList = new Array();
         }
         if(this._aipropList[param1] == null)
         {
            return false;
         }
         return true;
      }
      
      public function setRunningProp(param1:int, param2:*) : void
      {
         if(this._runningPropList == null)
         {
            this._runningPropList = new Array();
         }
         this._runningPropList[param1] = param2;
      }
      
      public function getRunningProp(param1:int) : *
      {
         if(this._runningPropList == null)
         {
            this._runningPropList = new Array();
         }
         if(this._runningPropList[param1] == null)
         {
            return null;
         }
         return this._runningPropList[param1];
      }
      
      public function hasRunningProp(param1:int) : Boolean
      {
         if(this._runningPropList == null)
         {
            this._runningPropList = new Array();
         }
         return this._runningPropList.hasOwnProperty(param1);//TODO:Fix it
      }
      
      public function setRunningPropList(param1:Array) : void
      {
         this._runningPropList = param1;
      }
      
      public function cleanRunningProp(param1:int) : void
      {
         if(this._runningPropList == null)
         {
            this._runningPropList = new Array();
         }
         delete this._runningPropList[param1];
      }
      
      public function set scrollRect(param1:Rectangle) : void
      {
         if(this._mask == null)
         {
            this._mask = new Shape();
         }
         if(param1 != null)
         {
            this._mask.x = param1.x;
            this._mask.y = param1.y;
            GraphicsUtils.drawRect(this._mask,0,0,param1.width,param1.height,0,1);
            this._frontLayer.mask = this._mask;
            this._frontLayer.addChild(this._mask);
         }
         else
         {
            GraphicsUtils.cleanContainer(this._mask);
            this._frontLayer.mask = null;
            UtilsManager.removeFromContainer(this._mask);
         }
      }
      
      public function get scrollRect() : Rectangle
      {
         if(this._mask == null || this._mask.parent == null)
         {
            return null;
         }
         return this._mask.getRect(this._mask);
      }
      
      public function get contentW() : int
      {
         return this._frontLayer.width;
      }
      
      public function get contentH() : int
      {
         return this._frontLayer.height;
      }
      
      public function showHPState() : void
      {
         var _loc3_:TDZombieData = null;
         if(!this.isVaild)
         {
            return;
         }
         if(this._needHpBar == -1)
         {
            if(this.objectModel.maxHp.get() > 0)
            {
               this._needHpBar = 1;
            }
            else
            {
               this._needHpBar = 0;
            }
         }
         if(this._needHpBar == 0)
         {
            return;
         }
         if(this._hpBar == null)
         {
            this._hpBar = new TDHpBar();
            this._frontLayer.addChild(this._hpBar.hpBarMC.asset);
            this.setHPBarLoaction(this.x,this.y,true);
         }
         this._isShowHpBar = true;
         this._hpHideTime = TDGameInfo.getInstance().getCurGameTime() + 3000;
         this._hpBar.hpBarMC.visible = true;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            _loc3_ = this.objectModel as TDZombieData;
            _loc1_ = _loc3_.getAllArmorCurHp();
            _loc2_ = _loc3_.getAllArmorMaxHp();
         }
         this._hpBar.updateValue(this.objectModel.curHp.get(),this.objectModel.maxHp.get(),_loc1_,_loc2_);
      }
      
      protected function hideHPState() : void
      {
         this._isShowHpBar = false;
         if(this._hpBar != null)
         {
            this._hpBar.hpBarMC.visible = false;
         }
      }
      
      private function updateHPState() : void
      {
         if(!this._isShowHpBar)
         {
            return;
         }
         if(this._hpHideTime < TDGameInfo.getInstance().getCurGameTime())
         {
            this.hideHPState();
         }
      }
      
      public function get hpBar() : TDHpBar
      {
         return this._hpBar;
      }
      
      private function cleanHPBar() : void
      {
         if(this._hpBar != null)
         {
            this._hpBar.Dispose();
            this._hpBar = null;
         }
      }
      
      public function setHPBarLoaction(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(this._isShowHpBar || param3)
         {
            this._hpBar.hpBarMC.x = this.damageArea.x + this.damageArea.width * 0.5 - this._hpBar.hpBarMC.width * 0.5;
            this._hpBar.hpBarMC.y = this.damageArea.y - this._hpBar.hpBarMC.height - 20;
         }
      }
   }
}

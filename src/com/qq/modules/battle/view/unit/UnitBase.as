package com.qq.modules.battle.view.unit
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import com.qq.constant.td.TDConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.view.control.BaseUnitControler;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.utils.DMath;
   import com.qq.utils.QBlitBoneUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class UnitBase
   {
      
      public static var instanceNum:int = 0;
       
      
      private var _animation:BlitBoneAnim;
      
      private var unitLayer:QCanvas;
      
      private var animaLayer:QCanvas;
      
      private var animaTopEffLayer:QCanvas;
      
      private var animaBottomEffLayer:QCanvas;
      
      private var animaAwakeBackEffectLayer:QCanvas;
      
      private var animaAwakeFrontEffectLayer:QCanvas;
      
      private var animaEffectList:Vector.<UnitEffectCav>;
      
      private var _animaRate:int = 1;
      
      private var _unitControlerDic:Dictionary;
      
      private var _hasDispose:Boolean = false;
      
      private var animaOffset:Point;
      
      public var _assetURL:String;
      
      public function UnitBase()
      {
         this.animaOffset = new Point();
         super();
         this.initialize();
         ++instanceNum;
      }
      
      protected function initialize() : void
      {
         this.unitLayer = new QCanvas();
         this.unitLayer.scrollRectEnabled = false;
         this.animaLayer = new QCanvas();
         this.animaLayer.scrollRectEnabled = false;
         this.animaTopEffLayer = new QCanvas();
         this.animaTopEffLayer.scrollRectEnabled = false;
         this.animaBottomEffLayer = new QCanvas();
         this.animaBottomEffLayer.scrollRectEnabled = false;
         this.animaAwakeBackEffectLayer = new QCanvas();
         this.animaAwakeBackEffectLayer.mouseChildren = false;
         this.animaAwakeBackEffectLayer.mouseEnabled = false;
         this.animaAwakeBackEffectLayer.scrollRectEnabled = false;
         this.animaAwakeFrontEffectLayer = new QCanvas();
         this.animaAwakeFrontEffectLayer.scrollRectEnabled = false;
         this.animaAwakeFrontEffectLayer.mouseChildren = false;
         this.animaAwakeFrontEffectLayer.mouseEnabled = false;
         this.unitLayer.addChild(this.animaAwakeBackEffectLayer);
         this.unitLayer.addChild(this.animaBottomEffLayer);
         this.unitLayer.addChild(this.animaLayer);
         this.unitLayer.addChild(this.animaTopEffLayer);
         this.unitLayer.addChild(this.animaAwakeFrontEffectLayer);
         this.animaEffectList = new Vector.<UnitEffectCav>();
         this._unitControlerDic = new Dictionary();
      }
      
      public function dispose() : void
      {
         var _loc1_:BaseUnitControler = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._hasDispose = true;
         UnitFactory.instance.removeUnit(this);
         if(this._animation)
         {
            this._animation.Dispose();
            this._animation = null;
         }
         if(this.display)
         {
            ToolTipManager.RegisterToolTip(this.display,null);
         }
         if(this._unitControlerDic)
         {
            for each(_loc1_ in this._unitControlerDic)
            {
               _loc1_.dispose();
            }
            this._unitControlerDic = null;
         }
         if(this.animaEffectList)
         {
            _loc2_ = this.animaEffectList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.animaEffectList[_loc3_].Dispose();
               _loc3_++;
            }
            this.animaEffectList = null;
         }
         this.unitLayer.Dispose();
         --instanceNum;
      }
      
      public function clear() : void
      {
         var _loc1_:BaseUnitControler = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this._unitControlerDic)
         {
            _loc1_.dispose();
         }
         this._unitControlerDic = new Dictionary();
         _loc2_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this.animaEffectList.length)
         {
            if(this.animaEffectList[_loc2_].parent)
            {
               this.animaEffectList[_loc2_].parent.removeChild(this.animaEffectList[_loc2_]);
            }
            this.animaEffectList[_loc2_].Dispose();
            _loc2_++;
         }
      }
      
      public function addControl(param1:BaseUnitControler) : void
      {
         if(this._unitControlerDic[param1.ctrType])
         {
            throw new Error("相同类型控制器只能添加一次!");
         }
         this._unitControlerDic[param1.ctrType] = param1;
         param1.setData(this,this.unitLayer,this.animaLayer);
      }
      
      public function getControlByType(param1:String) : BaseUnitControler
      {
         return this._unitControlerDic[param1] as BaseUnitControler;
      }
      
      public function removeControl(param1:String) : void
      {
         delete this._unitControlerDic[param1];
      }
      
      public function setAssetUrl(param1:String, param2:int = 0, param3:String = "idle", param4:Boolean = false, param5:Boolean = true) : void
      {
         var _loc6_:Bitmap = null;
         var _loc7_:int = 0;
         this._animation = BlitBoneManager.impl.createBoneAnim();
         this._assetURL = param1;
         this._animation.data = BlitBoneManager.impl.getBoneDataByUrl(param1);
         if(param2 != 0)
         {
            this._animation.frameRate = param2;
         }
         this._animation.frameRate *= this._animaRate;
         this.setAlpha(1);
         this.animaLayer.addChild(this._animation.asset.asset);
         if(param5)
         {
            this.animaLayer.x = BattleConst.GRID_WIDTH * 0.5;
            this.animaLayer.y = BattleConst.GRID_HEIGHT - BattleConst.ANCHORY;
         }
         this.animaBottomEffLayer.x = this.animaLayer.x;
         this.animaBottomEffLayer.y = this.animaLayer.y;
         this.animaTopEffLayer.x = this.animaLayer.x;
         this.animaTopEffLayer.y = this.animaLayer.y;
         this.animaAwakeBackEffectLayer.x = this.animaLayer.x;
         this.animaAwakeBackEffectLayer.y = this.animaLayer.y;
         this.animaAwakeFrontEffectLayer.x = this.animaLayer.x;
         this.animaAwakeFrontEffectLayer.y = this.animaLayer.y;
         if(param4)
         {
            _loc6_ = new Bitmap(AssetManager.GetNewClass("farm_shade") as BitmapData);
            _loc6_.x = -_loc6_.width / 2;
            _loc6_.y = -_loc6_.height / 2;
            this.animaBottomEffLayer.addChild(_loc6_);
            _loc7_ = DMath.randNum(-1,20);
            this._animation.gotoAndPlay(param3,0,_loc7_);
         }
         else
         {
            this._animation.gotoAndPlay(param3,0);
         }
      }
      
      public function setAnimaOffset(param1:Number, param2:Number) : void
      {
         this.animaOffset.x = param1;
         this.animaOffset.y = param2;
         if(this.animaLayer)
         {
            this.animaLayer.x += param1;
            this.animaLayer.y += param2;
            this.animaBottomEffLayer.x = this.animaLayer.x;
            this.animaBottomEffLayer.y = this.animaLayer.y;
            this.animaTopEffLayer.x = this.animaLayer.x;
            this.animaTopEffLayer.y = this.animaLayer.y;
            this.animaAwakeBackEffectLayer.x = this.animaLayer.x;
            this.animaAwakeBackEffectLayer.y = this.animaLayer.y;
            this.animaAwakeFrontEffectLayer.x = this.animaLayer.x;
            this.animaAwakeFrontEffectLayer.y = this.animaLayer.y;
         }
      }
      
      public function setScale(param1:Number, param2:Number) : void
      {
         this.animaLayer.scaleX = param1;
         this.animaLayer.scaleY = param2;
         this.animaLayer.x = BattleConst.GRID_WIDTH * 0.5;
         this.animaLayer.y = BattleConst.GRID_HEIGHT - BattleConst.ANCHORY;
         this.setAnimaOffset(this.animaOffset.x,this.animaOffset.y);
      }
      
      public function setScaleForAnimat(param1:Number, param2:Number) : void
      {
         this.animaLayer.scaleX = param1;
         this.animaLayer.scaleY = param2;
      }
      
      public function getAnimaOffsetPoint() : Point
      {
         if(this.animaLayer)
         {
            return new Point(this.animaLayer.x,this.animaLayer.y);
         }
         return new Point(0,0);
      }
      
      public function setXY(param1:Number, param2:Number) : void
      {
         if(this.unitLayer)
         {
            this.unitLayer.x = param1;
            this.unitLayer.y = param2;
         }
      }
      
      public function setRotation(param1:Number) : void
      {
         if(this.unitLayer)
         {
            this.unitLayer.rotation = param1;
         }
      }
      
      public function setAlpha(param1:Number) : void
      {
         if(this.unitLayer == null)
         {
            return;
         }
         this.unitLayer.alpha = param1;
         if(this.animatCav != null)
         {
            if(param1 == 0)
            {
               this.animatCav.visible = false;
            }
            else if(param1 > 0)
            {
               this.animatCav.visible = true;
            }
         }
      }
      
      public function set alpha(param1:Number) : void
      {
         this.setAlpha(param1);
      }
      
      public function get alpha() : Number
      {
         if(this.unitLayer == null)
         {
            return 1;
         }
         return this.unitLayer.alpha;
      }
      
      public function setAvatar(param1:CardChestAvatarTemp) : void
      {
         QBlitBoneUtil.updateAvatar(this.animation,param1);
      }
      
      public function setHideBones(param1:Array) : void
      {
         var _loc2_:IBlitDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(param1 && param1.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc4_ = param1[_loc3_];
               this.animation.setBoneVisibleRule(_loc4_,false);
               _loc3_++;
            }
         }
         this.animation.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
         this.animation.setBoneVisibleRule(TDConstant.Ground_LayerName2,false);
      }
      
      public function addGroundEffect(param1:String, param2:int = 0, param3:String = "idle") : UnitEffectCav
      {
         var _loc4_:UnitEffectCav = new UnitEffectCav(param1,param3);
         if(param2 != 0)
         {
            _loc4_.anim.frameRate = param2;
         }
         _loc4_.anim.frameRate *= this._animaRate;
         this.animaEffectList.push(_loc4_);
         this.animaBottomEffLayer.addChild(_loc4_);
         _loc4_.anim.gotoAndPlay(param3,0);
         return _loc4_;
      }
      
      public function addTopEffect(param1:String, param2:int = 0, param3:String = "idle") : UnitEffectCav
      {
         var _loc4_:UnitEffectCav = new UnitEffectCav(param1,param3);
         if(param2 != 0)
         {
            _loc4_.anim.frameRate = param2;
         }
         _loc4_.anim.frameRate *= this._animaRate;
         this.animaEffectList.push(_loc4_);
         this.animaTopEffLayer.addChild(_loc4_);
         _loc4_.anim.gotoAndPlay(param3,0);
         return _loc4_;
      }
      
      public function removeTopEffect(param1:UnitEffectCav) : void
      {
         if(this._hasDispose)
         {
            return;
         }
         if(!param1.hasDisposed)
         {
            this.animaTopEffLayer.removeChild(param1);
         }
         var _loc2_:int = this.animaEffectList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.animaEffectList[_loc3_] == param1)
            {
               this.animaEffectList.splice(_loc3_,1);
               _loc3_ = _loc2_;
            }
            _loc3_++;
         }
         param1.Dispose();
      }
      
      public function removeBottomEffect(param1:UnitEffectCav) : void
      {
         if(this._hasDispose)
         {
            return;
         }
         if(!param1.hasDisposed)
         {
            this.animaBottomEffLayer.removeChild(param1);
         }
         var _loc2_:int = this.animaEffectList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.animaEffectList[_loc3_] == param1)
            {
               this.animaEffectList.splice(_loc3_,1);
               _loc3_ = _loc2_;
            }
            _loc3_++;
         }
         param1.Dispose();
      }
      
      public function mirror() : void
      {
         var _loc1_:BaseUnitControler = null;
         if(this._animation)
         {
            this.animaLayer.scaleX = -this.animaLayer.scaleX;
            this.animaAwakeBackEffectLayer.scaleX = -this.animaAwakeBackEffectLayer.scaleX;
            this.animaAwakeFrontEffectLayer.scaleX = -this.animaAwakeFrontEffectLayer.scaleX;
         }
         for each(_loc1_ in this._unitControlerDic)
         {
            _loc1_.isRight = true;
         }
      }
      
      public function get animation() : BlitBoneAnim
      {
         return this._animation;
      }
      
      public function get animationDisplay() : QCanvas
      {
         return this.animaLayer;
      }
      
      public function get display() : QCanvas
      {
         return this.unitLayer;
      }
      
      public function getXY() : Point
      {
         if(this.unitLayer)
         {
            return new Point(this.unitLayer.x,this.unitLayer.y);
         }
         return new Point(0,0);
      }
      
      public function getAnimationXY() : Point
      {
         var _loc1_:Point = this.getXY();
         _loc1_.x += this.animaLayer.x;
         _loc1_.y += this.animaLayer.y;
         return _loc1_;
      }
      
      public function getGlobolPoint() : Point
      {
         var _loc1_:Point = this.getXY();
         if(this.unitLayer.parent)
         {
            return this.unitLayer.parent.localToGlobal(_loc1_);
         }
         return _loc1_;
      }
      
      public function get animatCav() : QCanvas
      {
         return this.animaLayer;
      }
      
      public function get animaRate() : int
      {
         return this._animaRate;
      }
      
      public function set animaRate(param1:int) : void
      {
         if(this._animaRate == param1)
         {
            return;
         }
         var _loc2_:int = this.animaEffectList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.animaEffectList[_loc3_].anim)
            {
               this.animaEffectList[_loc3_].anim.frameRate /= this._animaRate;
               this.animaEffectList[_loc3_].anim.frameRate *= param1;
            }
            _loc3_++;
         }
         if(this._animation)
         {
            this._animation.frameRate /= this._animaRate;
            this._animation.frameRate *= param1;
         }
         this._animaRate = param1;
      }
      
      public function getAnimaAwakeBackEffectLayer() : QCanvas
      {
         return this.animaAwakeBackEffectLayer;
      }
      
      public function getAnimaAwakeFrontEffectLayer() : QCanvas
      {
         return this.animaAwakeFrontEffectLayer;
      }
   }
}

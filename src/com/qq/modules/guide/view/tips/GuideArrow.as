package com.qq.modules.guide.view.tips
{
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.controls.Label;
   import asgui.core.Application;
   import asgui.core.Container;
   import asgui.core.IDisposable;
   import asgui.core.UIComponent;
   import asgui.managers.PopUpManager;
   import asgui.resources.AssetManager;
   import asgui.styles.StyleManager;
   import com.greensock.TweenMax;
   import com.greensock.plugins.GlowFilterPlugin;
   import com.greensock.plugins.TweenPlugin;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.guidePlus.model.templates.GuideTemplateFactory;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.filters.BitmapFilterQuality;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class GuideArrow extends Sprite implements IDisposable
   {
      
      public static var instance:GuideArrow;
       
      
      private var target:DisplayObject;
      
      private var blitTarget:IBlitDisplayObject;
      
      private var mcTargetRect:QCanvas;
      
      private var arrow:MovieClip;
      
      private var a1:DisplayObject;
      
      private var a2:DisplayObject;
      
      private var a3:DisplayObject;
      
      private var a4:DisplayObject;
      
      private var m_isLockW:Boolean;
      
      private var m_isLockH:Boolean;
      
      private var txt:TextField;
      
      private var GAP:int = 30;
      
      private var needUpdatePositionEnterFrame:Boolean;
      
      private var counter:int;
      
      private var tween:TweenMax;
      
      private var alphaAdd:Number = -0.02;
      
      private var _hasDisposed:Boolean;
      
      private var disposeEvent:String;
      
      private var m_targetWidth:Number;
      
      private var m_targetHeight:Number;
      
      private var targetXAdd:Number = 0;
      
      private var targetYAdd:Number = 0;
      
      private var xAdd:int;
      
      private var yAdd:int;
      
      private var alwaysVisible:Boolean;
      
      public function GuideArrow(param1:int = 0, param2:int = 0)
      {
         super();
         this.visible = false;
         this.arrow = AssetManager.GetNewClass("guide_arrow") as MovieClip;
         this.addChild(this.arrow);
         this.a1 = this.arrow["a1"];
         this.a2 = this.arrow["a2"];
         this.a3 = this.arrow["a3"];
         this.a4 = this.arrow["a4"];
         this.txt = this.arrow["txt"];
         StyleManager.GetStyleDeclaration(".TXT_GUIDE_ARROW_TIP",new Label()).SetTextFieldStyle(this.txt);
         this.txt.text = "";
         this.mcTargetRect = new QCanvas();
         this.mcTargetRect.styleName = ".Canvas_Guide_Target";
         this.addEventListener(Event.ENTER_FRAME,this.onFrame);
         instance = this;
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      private function clearTween() : void
      {
         if(this.tween)
         {
            this.tween.pause();
            this.tween = null;
         }
      }
      
      public function anchorTo(param1:Rectangle) : void
      {
         this.targetHeight = param1.width;
         this.targetWidth = param1.height;
      }
      
      public function init(param1:*, param2:int = 0, param3:int = 0, param4:String = null, param5:* = null, param6:Boolean = true, param7:Boolean = false, param8:Number = NaN, param9:Number = NaN) : void
      {
         var _loc10_:String = null;
         var _loc11_:int = 0;
         this.visible = false;
         this.yAdd = param3;
         this.xAdd = param2;
         this.m_isLockW = !isNaN(param8);
         this.m_isLockH = !isNaN(param9);
         this.m_targetWidth = param8;
         this.m_targetHeight = param9;
         this.alwaysVisible = param7;
         this.clearTween();
         this.blitTarget = null;
         this.disposeEvent = param4;
         this.target = null;
         if(param1 is DisplayObject)
         {
            this.target = param1;
         }
         else if(param1 is IBlitDisplayObject)
         {
            this.blitTarget = param1 as IBlitDisplayObject;
         }
         this.checkPosition();
         this.mcTargetRect.visible = param6;
         this.counter = 0;
         if(param5 == null)
         {
            _loc10_ = "";
         }
         else if(param5 is String)
         {
            _loc10_ = param5;
         }
         else
         {
            _loc11_ = int(param5);
            _loc10_ = GuideTemplateFactory.instance.getText(_loc11_);
         }
         this.txt.text = _loc10_;
         if(param5 && param6 && this.target)
         {
            TweenPlugin.activate([GlowFilterPlugin]);
            this.tween = TweenMax.fromTo(this.target,1,{"glowFilter":{
               "alpha":1,
               "color":16763904,
               "blurX":30,
               "blurY":30,
               "strength":2,
               "inner":false,
               "knockout":false,
               "quality":BitmapFilterQuality.LOW
            }},{"glowFilter":{
               "alpha":1,
               "color":16763904,
               "blurX":3,
               "blurY":3,
               "strength":2,
               "inner":false,
               "knockout":false,
               "quality":BitmapFilterQuality.LOW
            }});
            this.tween.repeat = -1;
            this.tween.yoyo = true;
            this.tween.play();
         }
         if(param4)
         {
            if(this.target)
            {
               this.target.addEventListener(param4,this.onDisposeEvent);
            }
            else if(this.blitTarget)
            {
               this.blitTarget.addEventListener(param4,this.onDisposeEvent);
            }
         }
      }
      
      protected function onDisposeEvent(param1:Event) : void
      {
         var _loc2_:IEventDispatcher = null;
         if(this.target != null)
         {
            _loc2_ = this.target;
         }
         else
         {
            _loc2_ = this.blitTarget;
         }
         if(_loc2_)
         {
            _loc2_.removeEventListener(param1.type,this.onDisposeEvent);
         }
         if(this.target)
         {
            this.target.filters = [];
         }
         this.Dispose();
      }
      
      private function checkPosition() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Rectangle = null;
         var _loc5_:Sprite = null;
         var _loc1_:* = this.target is UIComponent;
         if(this.target is Container)
         {
            if(!(this.target as Container).scrollRectEnabled)
            {
               _loc1_ = false;
            }
         }
         if(_loc1_)
         {
            this.needUpdatePositionEnterFrame = true;
            this.targetWidth = this.target.width;
            this.targetHeight = this.target.height;
            this.targetXAdd = this.targetWidth / 2;
            this.targetYAdd = this.targetHeight / 2;
         }
         else if(this.blitTarget != null)
         {
            this.needUpdatePositionEnterFrame = true;
            this.targetWidth = this.blitTarget.width;
            this.targetHeight = this.blitTarget.height;
            this.targetXAdd = this.targetWidth / 2;
            this.targetYAdd = this.targetHeight / 2;
         }
         else
         {
            if(this.target.parent == null)
            {
               (_loc5_ = new Sprite()).addChild(this.target);
            }
            _loc2_ = this.target.parent.scaleX;
            _loc3_ = this.target.parent.scaleY;
            _loc4_ = this.target.getRect(this.target.parent);
            this.targetWidth = _loc4_.width * _loc2_;
            this.targetHeight = _loc4_.height * _loc3_;
            this.targetXAdd = this.targetWidth / 2 + _loc4_.x - this.target.x;
            this.targetYAdd = this.targetHeight / 2 + _loc4_.y - this.target.y;
         }
         this.targetXAdd += this.xAdd;
         this.targetYAdd += this.yAdd;
      }
      
      protected function onFrame(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Point = null;
         var _loc4_:* = undefined;
         if(this.target == null && this.blitTarget == null)
         {
            return;
         }
         if(this.target)
         {
            _loc2_ = this.target.visible;
            _loc3_ = this.target.localToGlobal(new Point());
            _loc3_ = this.parent.globalToLocal(_loc3_);
            if((_loc4_ = this.target.stage) == null)
            {
               this.Dispose();
               return;
            }
         }
         else
         {
            _loc2_ = this.blitTarget.visible;
            _loc3_ = this.blitTarget.localToGlobal(new Point());
            _loc3_.x *= GameGloble.scaleCurrent;
            _loc3_.y *= GameGloble.scaleCurrent;
         }
         this.visible = this.alwaysVisible || _loc2_;
         if(this.needUpdatePositionEnterFrame)
         {
            this.checkPosition();
         }
         var _loc5_:int = Application.application.width;
         var _loc6_:int = 1;
         this.x = this.targetXAdd + _loc3_.x;
         this.y = this.targetYAdd + _loc3_.y;
         if(this.x < 125)
         {
            _loc6_ = 3;
         }
         else if(this.x > _loc5_ - 125)
         {
            _loc6_ = 4;
         }
         else if(this.y + this.targetHeight / 2 > 600)
         {
            _loc6_ = 2;
         }
         switch(_loc6_)
         {
            case 1:
               this.a1.visible = true;
               this.a2.visible = this.a3.visible = this.a4.visible = false;
               this.arrow.x = 0;
               this.arrow.y = 100;
               break;
            case 2:
               this.a2.visible = true;
               this.a1.visible = this.a3.visible = this.a4.visible = false;
               this.arrow.x = 0;
               this.arrow.y = -100;
               break;
            case 3:
               this.a3.visible = true;
               this.a2.visible = this.a1.visible = this.a4.visible = false;
               this.arrow.x = 150;
               this.arrow.y = 0;
               break;
            case 4:
               this.a4.visible = true;
               this.a2.visible = this.a3.visible = this.a1.visible = false;
               this.arrow.x = -150;
               this.arrow.y = 0;
         }
         this.mcTargetRect.x = -this.targetWidth / 2 - 10;
         this.mcTargetRect.y = -this.targetHeight / 2 - 10;
         this.mcTargetRect.width = this.targetWidth + 20;
         this.mcTargetRect.height = this.targetHeight + 20;
         this.mcTargetRect.alpha += this.alphaAdd;
         if(this.mcTargetRect.alpha <= 0.5 || this.mcTargetRect.alpha >= 1)
         {
            this.alphaAdd = -this.alphaAdd;
         }
      }
      
      public function Dispose() : void
      {
         if(!this.hasDisposed)
         {
            this.clearTween();
            if(this.disposeEvent && this.target)
            {
               this.target.removeEventListener(this.disposeEvent,this.onDisposeEvent);
            }
            this.removeEventListener(Event.ENTER_FRAME,this.onFrame);
            this.target = null;
            this.blitTarget = null;
            this._hasDisposed = true;
            instance = null;
            PopUpManager.RemovePopUp(this,false);
         }
      }
      
      private function set targetWidth(param1:Number) : void
      {
         if(!this.m_isLockW)
         {
            this.m_targetWidth = param1;
         }
      }
      
      private function get targetWidth() : Number
      {
         return this.m_targetWidth;
      }
      
      private function set targetHeight(param1:Number) : void
      {
         if(!this.m_isLockH)
         {
            this.m_targetHeight = param1;
         }
      }
      
      private function get targetHeight() : Number
      {
         return this.m_targetHeight;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
   }
}

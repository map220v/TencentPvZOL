package asgui.managers
{
   import asgui.controls.Alert;
   import asgui.core.Application;
   import asgui.core.IUIComponent;
   import asgui.events.PopUpEvent;
   import asgui.managers.popups.NonePopupEffect;
   import asgui.styles.StyleDeclaration;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class PopUpManagerImpl extends EventDispatcher implements IPopUpManagerImpl
   {
       
      
      private var _effect:IPopupEffect;
      
      private var popupInfo:Array;
      
      private var topModalWindowData:PopUpData;
      
      public function PopUpManagerImpl()
      {
         this.popupInfo = [];
         super();
         if(SystemManager.instance.stage == null)
         {
            setTimeout(this.addResizeHandler,10);
         }
         else
         {
            this.addResizeHandler();
         }
      }
      
      private function addResizeHandler() : void
      {
         SystemManager.instance.stage.addEventListener(Event.RESIZE,this.ResizeHandler);
      }
      
      public function get effect() : IPopupEffect
      {
         if(!this._effect)
         {
            this._effect = new NonePopupEffect();
         }
         return this._effect;
      }
      
      public function set effect(param1:IPopupEffect) : void
      {
         this._effect = param1;
      }
      
      public function CreatePopUp(param1:Class, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true) : DisplayObject
      {
         var _loc5_:DisplayObject = new param1() as DisplayObject;
         this.AddPopUp(_loc5_,param2,param3,param4);
         return _loc5_;
      }
      
      public function AddPopUp(param1:DisplayObject, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true, param5:Point = null) : void
      {
         var _loc6_:Sprite = null;
         if(param2 != null)
         {
            param2.addChild(param1);
         }
         else
         {
            if(param3)
            {
               _loc6_ = new Sprite();
               SystemManager.instance.popUpLayer.addChild(_loc6_);
            }
            SystemManager.instance.popUpLayer.addChild(param1);
         }
         if(!param5 && !param2)
         {
            this.CenterPopUp(param1);
         }
         this.AddPopedWindowData(param1,_loc6_);
         if(param3)
         {
            this.UpdateModalMask();
         }
         var _loc7_:PopUpData = this.GetPopedWindowData(param1);
         if(param4)
         {
            this.effect.AddPopUp(param1,!!_loc7_ ? _loc7_.modal : null,param5);
         }
         this.dispatchEvent(new PopUpEvent(PopUpEvent.ADDED,param1,param2,param3));
      }
      
      public function CenterPopUp(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         if(param1.stage)
         {
            _loc2_ = (param1.stage.stageWidth - param1.width) / 2;
            _loc3_ = (param1.stage.stageHeight - param1.height) / 2;
            _loc2_ = 2 * int(_loc2_ / 2);
            _loc3_ = 2 * int(_loc3_ / 2);
            if(_loc2_ < 0 || _loc3_ < 0)
            {
               if(param1 is IPopupDragableUI)
               {
                  _loc2_ = (_loc4_ = (param1 as IPopupDragableUI).CheckCenterPopUpWhenOutScreen(_loc2_,_loc3_)).x;
                  _loc3_ = _loc4_.y;
               }
               else
               {
                  if(_loc2_ < 0)
                  {
                     _loc2_ = 0;
                  }
                  if(_loc3_ < 0)
                  {
                     _loc3_ = 0;
                  }
               }
            }
            param1.x = _loc2_;
            param1.y = _loc3_;
         }
      }
      
      public function RemovePopUp(param1:DisplayObject, param2:Boolean = true) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObjectContainer = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:PopUpData = this.GetPopedWindowData(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.window;
            _loc5_ = _loc3_.parent;
         }
         else
         {
            _loc4_ = param1;
            _loc5_ = param1.parent;
         }
         if(param2)
         {
            setTimeout(this.$RemovePopUp,this.effect.RemovePopUp(_loc4_),_loc4_,_loc5_);
         }
         else if(_loc5_ && _loc5_.contains(_loc4_))
         {
            _loc5_.removeChild(_loc4_);
         }
         this.RemovePopedWindowData(_loc3_);
         this.UpdateModalMask();
         this.dispatchEvent(new PopUpEvent(PopUpEvent.REMOVED,param1));
      }
      
      protected function $RemovePopUp(param1:DisplayObject, param2:DisplayObjectContainer = null) : void
      {
         if(param2 && param2.contains(param1))
         {
            param2.removeChild(param1);
         }
      }
      
      public function BringToFront(param1:DisplayObject) : void
      {
         var _loc2_:PopUpData = this.GetPopedWindowData(param1);
         if(_loc2_)
         {
            _loc2_.parent.setChildIndex(param1,_loc2_.parent.numChildren - 1);
         }
      }
      
      public function BringToBottom(param1:DisplayObject) : void
      {
         var _loc2_:PopUpData = this.GetPopedWindowData(param1);
         if(_loc2_)
         {
            _loc2_.parent.setChildIndex(param1,0);
         }
      }
      
      public function hasPopedWindow(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:PopUpData = null;
         var _loc2_:int = this.popupInfo.length;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = this.popupInfo[_loc3_] as PopUpData).className == param1)
            {
               return true;
            }
            _loc3_--;
         }
         return false;
      }
      
      protected function GetPopedWindowData(param1:DisplayObject) : PopUpData
      {
         var _loc3_:int = 0;
         var _loc4_:PopUpData = null;
         var _loc2_:int = this.popupInfo.length;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = this.popupInfo[_loc3_] as PopUpData).window == param1)
            {
               return _loc4_;
            }
            _loc3_--;
         }
         return null;
      }
      
      protected function RemovePopedWindowData(param1:PopUpData) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.popupInfo.length;
         _loc3_ = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(this.popupInfo[_loc3_] as PopUpData == param1)
            {
               if(param1.modal)
               {
                  if(param1.parent.contains(param1.modal))
                  {
                     param1.parent.removeChild(param1.modal);
                  }
               }
               param1.window.removeEventListener(Event.ENTER_FRAME,this.ModalWindowEnterFrameHandler);
               param1.Dispose();
               this.popupInfo.splice(_loc3_,1);
               return;
            }
            _loc3_--;
         }
      }
      
      protected function AddPopedWindowData(param1:DisplayObject, param2:Sprite) : void
      {
         this.popupInfo.push(new PopUpData(param1,param1.parent,param2));
      }
      
      public function UpdateModalMask() : void
      {
         var _loc2_:int = 0;
         var _loc3_:PopUpData = null;
         this.RemoveModalWindowListen();
         var _loc1_:int = this.popupInfo.length;
         _loc2_ = _loc1_ - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.popupInfo[_loc2_] as PopUpData;
            if(_loc3_.modal)
            {
               this.DrawModalMask(_loc3_,_loc3_.modal.graphics);
               break;
            }
            _loc2_--;
         }
      }
      
      private function DrawModalMask(param1:PopUpData, param2:Graphics) : void
      {
         var _loc6_:StyleDeclaration = null;
         param2.clear();
         if(param1.window is IUIComponent)
         {
            if(_loc6_ = (param1.window as IUIComponent).styleDeclaration)
            {
               param2.beginFill(_loc6_.modalTransparencyColor,_loc6_.modalTransparency);
            }
         }
         var _loc3_:int = !!Application.application ? int(Application.application.width) : int(SystemManager.instance.width);
         var _loc4_:int = !!Application.application ? int(Application.application.height) : int(SystemManager.instance.height);
         var _loc5_:DisplayObject = param1.window;
         param2.drawRect(0,0,_loc3_,_loc4_);
         param2.endFill();
      }
      
      private function ResizeHandler(param1:Event) : void
      {
         this.OnResize();
         this.UpdateModalMask();
      }
      
      protected function OnResize() : void
      {
         var _loc2_:int = 0;
         var _loc3_:PopUpData = null;
         var _loc1_:int = this.popupInfo.length;
         _loc2_ = _loc1_ - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.popupInfo[_loc2_] as PopUpData;
            if(_loc3_.window is Alert || _loc3_.window is IPopupDragableUI && !(_loc3_.window as IPopupDragableUI).dragable)
            {
               this.CenterPopUp(_loc3_.window);
            }
            _loc2_--;
         }
      }
      
      private function AddModalWindowListen(param1:PopUpData) : void
      {
         this.topModalWindowData = param1;
      }
      
      private function RemoveModalWindowListen() : void
      {
         if(this.topModalWindowData != null)
         {
            if(this.topModalWindowData.window != null)
            {
               this.topModalWindowData.window.removeEventListener(Event.ENTER_FRAME,this.ModalWindowEnterFrameHandler);
            }
            this.topModalWindowData = null;
         }
      }
      
      private function ModalWindowEnterFrameHandler(param1:Event) : void
      {
         if(this.topModalWindowData.positionOrSizeChanged)
         {
            this.DrawModalMask(this.topModalWindowData,SystemManager.instance.maskLayer.graphics);
         }
      }
   }
}

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.utils.getQualifiedClassName;

class PopUpData
{
    
   
   public var className:String;
   
   public var window:DisplayObject;
   
   public var parent:DisplayObjectContainer;
   
   public var modal:Sprite;
   
   private var lastRect:Rectangle;
   
   function PopUpData(param1:DisplayObject, param2:DisplayObjectContainer, param3:Sprite)
   {
      super();
      this.className = getQualifiedClassName(param1);
      this.window = param1;
      this.parent = param2;
      this.modal = param3;
      this.lastRect = new Rectangle(param1.x,param1.y,param1.width,param1.height);
   }
   
   public function Dispose() : void
   {
      this.window = null;
      this.parent = null;
   }
   
   public function get positionOrSizeChanged() : Boolean
   {
      if(this.window.x != this.lastRect.x || this.window.y != this.lastRect.y || this.window.width != this.lastRect.width || this.window.height != this.lastRect.height)
      {
         this.lastRect = new Rectangle(this.window.x,this.window.y,this.window.width,this.window.height);
         return true;
      }
      return false;
   }
}

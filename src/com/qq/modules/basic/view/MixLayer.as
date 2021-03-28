package com.qq.modules.basic.view
{
   import asgui.blit.display.starling.IBlitDisplayStarling;
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import com.qq.modules.td.view.game.layer.IDisplay;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class MixLayer extends Sprite implements IDisplay, IDisposable
   {
      
      private static var _needClearedResList:Array;
       
      
      public var display:Object;
      
      private var _hasDisposed:Boolean;
      
      public function MixLayer()
      {
         super();
         this.init();
      }
      
      public static function addNeedClearedRes(param1:Object) : void
      {
         if(_needClearedResList == null)
         {
            _needClearedResList = new Array();
         }
         _needClearedResList.push(param1);
      }
      
      public static function cleanAllNeedClearedRes() : void
      {
         var _loc1_:Object = null;
         if(_needClearedResList == null)
         {
            return;
         }
         while(_needClearedResList.length > 0)
         {
            _loc1_ = _needClearedResList.pop();
            if(_loc1_ is Bitmap)
            {
               UtilsManager.removeFromContainer(_loc1_);
               if((_loc1_ as Bitmap).bitmapData != null)
               {
                  (_loc1_ as Bitmap).bitmapData.dispose();
               }
            }
         }
      }
      
      public function get assetLayer() : Object
      {
         return this.display;
      }
      
      protected function init() : void
      {
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.display = this;
      }
      
      override public function set name(param1:String) : void
      {
         super.name = param1;
         if(this.display && this.display != this)
         {
            this.display.name = this.name;
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
      }
      
      public function getStarlingContainer() : Object
      {
         return GameGloble.getStarlingContainer();
      }
      
      public function drawLine(param1:int, param2:int, param3:int, param4:int, param5:uint) : void
      {
         var _loc6_:Graphics = null;
         (_loc6_ = (this.display as Sprite).graphics).lineStyle(1,param5);
         _loc6_.moveTo(param1,param2);
         _loc6_.lineTo(param3,param4);
      }
      
      public function drawRect(param1:int, param2:int, param3:int, param4:int, param5:uint, param6:Number = 1) : void
      {
         var _loc7_:Graphics = null;
         (_loc7_ = (this.display as Sprite).graphics).lineStyle(0);
         _loc7_.beginFill(param5,param6);
         _loc7_.drawRect(param1,param2,param3,param4);
         _loc7_.endFill();
      }
      
      public function cleanDrawContent() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = (this.display as Sprite).graphics;
         _loc1_.clear();
      }
      
      public function setVisible(param1:Boolean) : void
      {
         this.display.visible = param1;
      }
      
      public function getVisible() : Boolean
      {
         return this.display.visible;
      }
      
      public function setEnable(param1:Boolean) : void
      {
         mouseEnabled = param1;
         mouseChildren = param1;
         this.display.mouseEnabled = param1;
         this.display.mouseChildren = param1;
      }
      
      public function setButtonMode(param1:Boolean) : void
      {
         this.display.buttonMode = param1;
      }
      
      public function addMixLayer(param1:MixLayer) : void
      {
         addChild(param1);
      }
      
      public function addComponentToLayer(param1:Object, param2:Boolean = false, param3:Boolean = false, param4:String = null) : void
      {
         if(param1 == null)
         {
            getLogger().debug("增加空对象到显示列表");
            return;
         }
         var _loc5_:int = -1;
         if(param2)
         {
            _loc5_ = 0;
         }
         if(param1 is IDisplay)
         {
            if(_loc5_ == -1)
            {
               addChild(param1 as DisplayObject);
            }
            else
            {
               addChildAt(param1 as DisplayObject,_loc5_);
            }
         }
         else if(param1 is Bitmap)
         {
            if(_loc5_ == -1)
            {
               this.display.addChild(param1);
            }
            else
            {
               this.display.addChildAt(param1 as Bitmap,_loc5_);
            }
            addNeedClearedRes(param1);
         }
         else if(param1 is DisplayObject)
         {
            if(_loc5_ == -1)
            {
               addChild(param1 as DisplayObject);
            }
            else
            {
               addChildAt(param1 as DisplayObject,_loc5_);
            }
         }
         else if(param1 is IBlitDisplayStarling)
         {
            this.display.addChild((param1 as IBlitDisplayStarling).asset);
         }
         else
         {
            getLogger().debug("添加未知的显示对象");
         }
      }
      
      public function setNormalX(param1:Number) : void
      {
         super.x = param1;
      }
      
      public function setNormalScale(param1:Number) : void
      {
         this.scaleX = this.scaleY = param1;
      }
      
      public function getNormalScale() : Number
      {
         return this.scaleX;
      }
      
      public function setStarlingScale(param1:Number) : void
      {
      }
      
      public function Dispose() : void
      {
         this.removeAllChild();
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function removeAllChild() : void
      {
         var _loc1_:* = undefined;
         this.disposeToEnd(this.display);
         this.disposeToEnd(this);
      }
      
      private function disposeToEnd(param1:*) : void
      {
         var _loc2_:Object = null;
         while(param1.numChildren > 0)
         {
            _loc2_ = param1.removeChildAt(0);
            if(_loc2_ is IDisposable)
            {
               (_loc2_ as IDisposable).Dispose();
            }
            if(_loc2_.hasOwnProperty("numChildren") && _loc2_.numChildren > 0)
            {
               this.disposeToEnd(_loc2_);
            }
         }
      }
      
      public function removeSelf() : void
      {
         this.removeAllChild();
         UtilsManager.removeFromContainer(this.display);
         UtilsManager.removeFromContainer(this);
      }
      
      override public function toString() : String
      {
         return "[MixLayer] " + name;
      }
      
      public function setLocation(param1:Number, param2:Number) : void
      {
         x = param1;
         y = param2;
      }
   }
}

package asgui.managers
{
   import asgui.controls.ToolTip;
   import asgui.core.Application;
   import asgui.core.IToolTip;
   import asgui.events.AsguiEvent;
   import asgui.managers.tooltips.NoneToolTipEffect;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   
   public class ToolTipManagerImpl extends EventDispatcher implements IToolTipManagerImpl
   {
       
      
      private var _toolTipEffect:IToolTipEffect;
      
      private var toolTip:IToolTip;
      
      private var toolTipData:ToolTipData;
      
      private var toolTipInfo:Dictionary;
      
      private var _enabled:Boolean = true;
      
      private var _showDelay:Number = 500;
      
      private var lastDelayTimeout:uint;
      
      private var lastShowDelayTooltipData:ToolTipData;
      
      public function ToolTipManagerImpl(param1:IEventDispatcher = null)
      {
         this.toolTipInfo = new Dictionary();
         super(param1);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get showDelay() : Number
      {
         return this._showDelay;
      }
      
      public function set showDelay(param1:Number) : void
      {
         this._showDelay = param1;
      }
      
      public function RegisterToolTip(param1:DisplayObject, param2:Object, param3:Class = null) : void
      {
         if(param2 != null)
         {
            if(this.toolTipInfo[param1] == null)
            {
               param1.addEventListener(MouseEvent.ROLL_OVER,this.ToolTipMouseOverHandler);
               param1.addEventListener(MouseEvent.ROLL_OUT,this.ToolTipMouseOutHandler);
               param1.addEventListener(MouseEvent.MOUSE_MOVE,this.ToolTipMouseMoveHandler);
               param1.addEventListener(Event.REMOVED_FROM_STAGE,this.ToolTipRemovedFromStageHandler);
            }
            this.toolTipInfo[param1] = new ToolTipData(param1,param2,!!param3 ? param3 : ToolTip);
            if(this.toolTip && this.toolTipData && this.toolTipData.target == param1)
            {
               this.toolTip.text = param2;
            }
         }
         else if(this.toolTipInfo[param1] != null)
         {
            param1.removeEventListener(MouseEvent.ROLL_OVER,this.ToolTipMouseOverHandler);
            param1.removeEventListener(MouseEvent.ROLL_OUT,this.ToolTipMouseOutHandler);
            param1.removeEventListener(MouseEvent.MOUSE_MOVE,this.ToolTipMouseMoveHandler);
            param1.removeEventListener(Event.REMOVED_FROM_STAGE,this.ToolTipRemovedFromStageHandler);
            (this.toolTipInfo[param1] as ToolTipData).Dispose();
            this.HideImmediately(param1);
            this.toolTipInfo[param1] = null;
            delete this.toolTipInfo[param1];
         }
      }
      
      public function CreateToolTip(param1:Object, param2:Number = NaN, param3:Number = NaN, param4:IToolTip = null, param5:DisplayObject = null) : IToolTip
      {
         var _loc6_:DisplayObject = null;
         if(param4 == null)
         {
            param4 = new ToolTip();
         }
         this.RemoveAllTooltips(false);
         if(!SystemManager.instance.toolTipLayer.contains(param4 as DisplayObject))
         {
            SystemManager.instance.toolTipLayer.addChild(param4 as DisplayObject);
            (param4 as DisplayObject).alpha = 0;
         }
         if((param4 as DisplayObject).alpha == 0)
         {
            clearTimeout(this.lastDelayTimeout);
            this.lastDelayTimeout = 0;
            this.toolTipEffect.ShowImmediately(param4);
         }
         this.toolTip = param4;
         if(param4.text != param1)
         {
            param4.text = param1;
         }
         if(isNaN(param2) || isNaN(param3))
         {
            this.UpdatePosition(param5);
            param4.addEventListener(AsguiEvent.HEIGHT_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
            param4.addEventListener(AsguiEvent.WIDTH_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
         }
         else
         {
            _loc6_ = !!Application.application ? Application.application : SystemManager.instance;
            if(param2 < 0)
            {
               param2 = 0;
            }
            else if(param2 > _loc6_.width - param4.width)
            {
               param2 = _loc6_.width - param4.width;
            }
            if(param3 < 0)
            {
               param3 = 0;
            }
            else if(param3 > _loc6_.height - param4.height)
            {
               param3 = _loc6_.height - param4.height;
            }
            param4.x = param2;
            param4.y = param3;
         }
         return param4;
      }
      
      public function DestroyToolTip(param1:IToolTip = null) : void
      {
         if(param1 == null)
         {
            this.RemoveAllTooltips();
         }
         else
         {
            this.toolTipEffect.HideImmediately(param1);
         }
      }
      
      public function set toolTipEffect(param1:IToolTipEffect) : void
      {
         this._toolTipEffect = param1;
      }
      
      public function get toolTipEffect() : IToolTipEffect
      {
         if(!this._toolTipEffect)
         {
            this._toolTipEffect = new NoneToolTipEffect();
         }
         return this._toolTipEffect;
      }
      
      private function ShowImmediately(param1:ToolTipData) : void
      {
         this.toolTipData = param1;
         clearTimeout(this.lastDelayTimeout);
         this.lastDelayTimeout = 0;
         if(param1.toolTipClass == null)
         {
            return;
         }
         if(this.toolTip && getQualifiedClassName(this.toolTip) != getQualifiedClassName(param1.toolTipClass))
         {
            this.RemoveAllTooltips();
         }
         if(!this.toolTip)
         {
            this.toolTip = new param1.toolTipClass() as IToolTip;
            SystemManager.instance.toolTipLayer.addChild(this.toolTip as DisplayObject);
         }
         this.toolTip.text = param1.newToolTip;
         this.UpdatePosition(param1.target as DisplayObject);
         this.toolTip.addEventListener(AsguiEvent.HEIGHT_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
         this.toolTip.addEventListener(AsguiEvent.WIDTH_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
         this.toolTipEffect.ShowImmediately(this.toolTip);
      }
      
      public function AddToolTip(param1:IToolTip) : void
      {
         this.RemoveAllTooltips();
         this.toolTip = param1;
         SystemManager.instance.toolTipLayer.addChild(param1 as DisplayObject);
         this.UpdatePosition();
         param1.addEventListener(AsguiEvent.HEIGHT_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
         param1.addEventListener(AsguiEvent.WIDTH_CHANGED,this.ToolTipSizeChangedHandler,false,0,true);
         this.toolTipEffect.ShowImmediately(param1);
      }
      
      public function RemoveAllTooltips(param1:Boolean = true) : void
      {
         var _loc2_:IToolTip = null;
         while(SystemManager.instance.toolTipLayer.numChildren > 0)
         {
            _loc2_ = SystemManager.instance.toolTipLayer.removeChildAt(0) as IToolTip;
            if(param1 && !_loc2_.hasDisposed)
            {
               _loc2_.Dispose();
            }
         }
         this.toolTip = null;
      }
      
      private function ShowDelay(param1:ToolTipData) : void
      {
         clearTimeout(this.lastDelayTimeout);
         if(this.showDelay <= 0)
         {
            this.ShowImmediately(param1);
         }
         else
         {
            this.lastDelayTimeout = setTimeout(this.ShowImmediately,this.showDelay,param1);
            this.lastShowDelayTooltipData = param1;
         }
      }
      
      public function HideImmediately(param1:DisplayObject) : void
      {
         if(this.lastShowDelayTooltipData != null && param1 == this.lastShowDelayTooltipData.target)
         {
            clearTimeout(this.lastDelayTimeout);
            this.lastShowDelayTooltipData = null;
         }
         if(this.toolTip)
         {
            this.toolTipEffect.HideImmediately(this.toolTip);
         }
      }
      
      public function UpdatePosition(param1:DisplayObject = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc6_:Point = null;
         if(!this.toolTip)
         {
            return;
         }
         var _loc4_:int = Application.application.stage.stageWidth;
         var _loc5_:int = Application.application.stage.stageHeight;
         _loc2_ = Application.application.stage.mouseX + 5;
         _loc3_ = Application.application.stage.mouseY + 5;
         if((this.toolTip as Object).hasOwnProperty("toolTipOffsetX"))
         {
            _loc2_ += int(this.toolTip["toolTipOffsetX"]);
         }
         if((this.toolTip as Object).hasOwnProperty("toolTipOffsetY"))
         {
            _loc3_ += int(this.toolTip["toolTipOffsetY"]);
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ + this.toolTip.width > _loc4_)
         {
            _loc2_ = _loc4_ - this.toolTip.width;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         else if(_loc3_ + this.toolTip.height > _loc5_)
         {
            _loc3_ = _loc5_ - this.toolTip.height;
         }
         if((this.toolTip as Object).hasOwnProperty("toolTipPositionLastCheckFunction"))
         {
            _loc2_ = (_loc6_ = this.toolTip["toolTipPositionLastCheckFunction"](_loc2_,_loc3_)).x;
            _loc3_ = _loc6_.y;
         }
         _loc2_ = int(_loc2_ / 2) * 2;
         _loc3_ = int(_loc3_ / 2) * 2;
         this.toolTipEffect.UpdatePosition(this.toolTip,_loc2_,_loc3_,param1);
      }
      
      private function ToolTipSizeChangedHandler(param1:AsguiEvent) : void
      {
         this.UpdatePosition();
      }
      
      private function ToolTipMouseOverHandler(param1:MouseEvent) : void
      {
         if(!this._enabled)
         {
            return;
         }
         var _loc2_:ToolTipData = this.toolTipInfo[param1.currentTarget] as ToolTipData;
         this.ShowDelay(_loc2_);
      }
      
      private function ToolTipMouseOutHandler(param1:MouseEvent) : void
      {
         this.HideImmediately(param1.currentTarget as DisplayObject);
      }
      
      private function ToolTipRemovedFromStageHandler(param1:Event) : void
      {
         this.HideImmediately(param1.currentTarget as DisplayObject);
      }
      
      private function ToolTipMouseMoveHandler(param1:MouseEvent) : void
      {
         this.UpdatePosition();
      }
   }
}

import asgui.controls.ToolTip;
import flash.display.DisplayObject;

class ToolTipData
{
    
   
   public var target:DisplayObject;
   
   public var newToolTip:Object;
   
   public var toolTipClass:Class;
   
   function ToolTipData(param1:DisplayObject, param2:Object, param3:Class)
   {
      super();
      this.target = param1;
      this.newToolTip = param2;
      if(param3 != null)
      {
         this.toolTipClass = param3;
      }
      else
      {
         this.toolTipClass = ToolTip;
      }
   }
   
   public function Dispose() : void
   {
      this.target = null;
      this.toolTipClass = null;
   }
}

package com.qq.modules.guide.view.tips
{
   import asgui.controls.Text;
   import asgui.core.Application;
   import asgui.core.IToolTip;
   import asgui.managers.PopUpManager;
   import com.qq.display.QCanvas;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class GuideTip extends QCanvas implements IToolTip
   {
       
      
      private var txt:Text;
      
      private var ui:Sprite;
      
      public var disposeNotificationTypes:Array;
      
      private var _text:String;
      
      private var disposeEventType:String;
      
      public function GuideTip(param1:Sprite, param2:String = null, param3:Array = null)
      {
         this.disposeEventType = param2;
         this.disposeNotificationTypes = param3;
         this.ui = param1;
         super(GuideTipMediator);
         if(param2)
         {
            param1.addEventListener(param2,this.onEvent);
         }
      }
      
      override public function Dispose() : void
      {
         if(this.ui && this.disposeEventType)
         {
            this.ui.removeEventListener(this.disposeEventType,this.onEvent);
         }
         PopUpManager.RemovePopUp(this);
         this.txt = null;
         this.ui = null;
         super.Dispose();
      }
      
      protected function onEvent(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onEvent);
         this.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.txt = new Text();
         this.txt.styleName = ".ToolTip_WITH_TOP_ARROW_Text";
         this.txt.vcenter = 0;
         this.txt.right = 10;
         this.txt.left = 10;
         this.addChild(this.txt);
      }
      
      public function get text() : Object
      {
         return this._text;
      }
      
      public function set text(param1:Object) : void
      {
         this._text = param1 as String;
         this.txt.text = this._text;
         this.txt.height = NaN;
         this.width = 200;
         this.height = 100;
      }
      
      public function resetLocation() : void
      {
         var _loc1_:Point = this.ui.localToGlobal(new Point());
         this.x = _loc1_.x - this.width / 2 + this.ui.width / 2;
         if(this.x < 0)
         {
            this.x = 0;
         }
         if(_loc1_.y < Application.application.height / 2)
         {
            this.y = _loc1_.y + this.ui.height + 30;
            this.styleName = ".ToolTip_WITH_TOP_ARROW";
         }
         else
         {
            this.y = _loc1_.y - this.height - 30;
            this.styleName = ".ToolTip_WITH_BOTTOM_ARROW";
         }
      }
   }
}

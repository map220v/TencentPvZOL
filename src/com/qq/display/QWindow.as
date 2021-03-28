package com.qq.display
{
   import asgui.containers.Window;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class QWindow extends Window
   {
       
      
      private var _isShowTitleBG:Boolean = false;
      
      private var _img_titleBG:Image;
      
      public function QWindow(param1:Class = null)
      {
         super();
         var _loc2_:String = getQualifiedClassName(this);
         var _loc3_:Array = _loc2_.split("::");
         this.name = _loc3_[1];
         if(param1 != null)
         {
            RobotlegExtendCmd.registerMapView(getDefinitionByName(_loc2_),param1);
            RobotlegExtendCmd.createMediator(this);
         }
      }
      
      protected function setTitleBG(param1:Boolean) : void
      {
         this._isShowTitleBG = param1;
      }
      
      override protected function CheckTitleTextCreated() : void
      {
         var _loc1_:TextFormat = null;
         super.CheckTitleTextCreated();
         if(this._isShowTitleBG && this._img_titleBG == null)
         {
            this._img_titleBG = new Image();
            this._img_titleBG.width = 660;
            this._img_titleBG.height = 99;
            this._img_titleBG.source = AssetManager.GetClass("Window_Title_BG");
            this._img_titleBG.y = -88;
            this._img_titleBG.hcenter = 0;
            addChild(this._img_titleBG);
            scrollRectEnabled = false;
            _loc1_ = new TextFormat();
            _loc1_.size = 28;
            textFiledTitle.defaultTextFormat = _loc1_;
         }
      }
      
      override public function ValidateSize() : void
      {
         super.ValidateSize();
         if(this._isShowTitleBG && textFiledTitle != null)
         {
            textFiledTitle.y = -18;
         }
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1 * 2 / 2);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1 * 2 / 2);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         RobotlegExtendCmd.removeMediatorByView(this,this.name);
      }
      
      public function getMediator() : BasicScreenMediator
      {
         return ExtendContext.instance.getMediatorMap().retrieveMediator(this) as BasicScreenMediator;
      }
      
      public function reset(param1:Object = null) : void
      {
         this.getMediator().reset(param1);
      }
   }
}

package com.qq.modules.city.view
{
   import asgui.controls.Image;
   import asgui.managers.LoaderManager;
   import asgui.managers.PopUpManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.city.CityGlobals;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class CityNewButtonAppearWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:CityNewButtonAppearWindow;
      
      public var buttonID:String;
      
      public function CityNewButtonAppearWindowMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.loader = LoaderManager.GetLoader(UrlManager.getInstance().getUrl(UrlManager.Url_CityBuilding,"cityButtonAppearEffect.swf"));
         LoaderManager.impl.addEventListener(Event.CLOSE,this.onloadCompleteHandler);
         this.view.addChild(this.view.loader);
         addComponentListener(this.view,Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onResize(param1:Event) : void
      {
         this.view.loader.x = GameGloble.stage.stageWidth * 0.5;
         this.view.loader.y = GameGloble.stage.stageHeight * 0.5;
      }
      
      private function onloadCompleteHandler(param1:Event) : void
      {
         var _loc3_:Image = null;
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.onloadCompleteHandler);
         var _loc2_:MovieClip = this.view.loader.content as MovieClip;
         if(_loc2_ != null)
         {
            _loc3_ = new Image();
            _loc3_.mouseChildren = false;
            _loc3_.mouseEnabled = false;
            _loc3_.source = CityButtonConstant.buttonResList[this.buttonID];
            _loc3_.x = -CityGlobals.New_ButtonW * 0.5;
            _loc3_.y = -CityGlobals.New_ButtonH * 0.5 - 40;
            _loc2_.mc.btn.addChild(_loc3_);
         }
         _loc2_.addEventListener(Event.ENTER_FRAME,this.onPlayComplete);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this.buttonID = param1 as String;
      }
      
      private function onPlayComplete(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.target as MovieClip;
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.onPlayComplete);
            _loc2_.stop();
            CommandDispatcher.send(CommandName.Guide_Add_ButtonEffect,{"id":this.buttonID});
            PopUpManager.RemovePopUp(this.view);
            this.view.Dispose();
         }
      }
   }
}

package com.qq.utils
{
   import asgui.controls.Button;
   import asgui.managers.LoaderManager;
   import com.qq.GameGloble;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.templates.font.FontHKHB;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   
   public class AnimateManager
   {
      
      private static var _loader:Loader;
      
      private static var _stopSound:Boolean;
      
      private static var _callBack:Function;
      
      private static var _fullMovie:MovieClip;
      
      private static var _contentMovie:MovieClip;
      
      private static var _cover:Sprite;
      
      private static var _crossBtn:Button;
       
      
      public function AnimateManager()
      {
         super();
      }
      
      public static function playFullScreenMovie(param1:String, param2:Boolean = true, param3:Function = null) : void
      {
         if(param1 == null || param1 == "")
         {
            throw new Error("影片名称不能为空");
         }
         _stopSound = param2;
         _callBack = param3;
         _loader = LoaderManager.GetLoader(param1);
         _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,LoaderComletedHandler);
         _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,LoaderIoErrorHandler);
         CommonCmd.showLoading();
      }
      
      private static function LoaderComletedHandler(param1:Event) : void
      {
         var _loc2_:LoaderInfo = null;
         var _loc3_:Sprite = null;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,LoaderComletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,LoaderIoErrorHandler);
         if(param1.currentTarget is LoaderInfo)
         {
            _loc2_ = param1.currentTarget as LoaderInfo;
            _fullMovie = _loc2_.content as MovieClip;
            if(_fullMovie && _fullMovie.numChildren > 0)
            {
               _contentMovie = _fullMovie.getChildAt(0) as MovieClip;
               if(_contentMovie)
               {
                  _loc3_ = getCover();
                  GameGloble.stage.addChild(_loc3_);
                  GameGloble.stage.addChild(_fullMovie);
                  GameGloble.stage.addChild(crossBtn);
                  layout();
                  if(_stopSound)
                  {
                     SoundCmd.pauseAllSound();
                  }
                  _contentMovie.addEventListener(Event.ENTER_FRAME,onEnterFrame);
                  _contentMovie.gotoAndPlay(1);
                  crossBtn.addEventListener(MouseEvent.CLICK,onCross);
                  GameGloble.stage.addEventListener(Event.RESIZE,onResize);
               }
               else
               {
                  end();
               }
            }
            else
            {
               end();
            }
         }
      }
      
      protected static function onEnterFrame(param1:Event) : void
      {
         if(_contentMovie.currentFrame == _contentMovie.totalFrames)
         {
            GameGloble.stage.removeEventListener(Event.RESIZE,onResize);
            _contentMovie.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
            _contentMovie.stop();
            UtilsManager.removeFromContainer(_fullMovie);
            end();
         }
      }
      
      private static function LoaderIoErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,LoaderComletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,LoaderIoErrorHandler);
         end();
      }
      
      private static function end() : void
      {
         if(_stopSound)
         {
            SoundCmd.resumeAllSound();
         }
         var _loc1_:Sprite = getCover();
         UtilsManager.removeFromContainer(_loc1_);
         UtilsManager.removeFromContainer(crossBtn);
         if(_fullMovie)
         {
            _fullMovie.stop();
            _fullMovie = null;
         }
         if(_callBack != null)
         {
            _callBack();
         }
      }
      
      private static function onCross(param1:MouseEvent) : void
      {
         GameGloble.stage.removeEventListener(Event.RESIZE,onResize);
         crossBtn.removeEventListener(MouseEvent.CLICK,onCross);
         _contentMovie.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         _contentMovie.stop();
         UtilsManager.removeFromContainer(_fullMovie);
         end();
      }
      
      private static function onResize(param1:Event) : void
      {
         layout();
      }
      
      private static function layout() : void
      {
         _contentMovie.x = GameGloble.stage.stageWidth * 0.5;
         _contentMovie.y = GameGloble.stage.stageHeight * 0.5;
         var _loc1_:Sprite = getCover();
         _loc1_.width = GameGloble.stage.stageWidth;
         _loc1_.height = GameGloble.stage.stageHeight;
         _loc1_.x = 0;
         _loc1_.y = 0;
         crossBtn.x = GameGloble.stage.stageWidth - 120;
         crossBtn.y = GameGloble.stage.stageHeight - 60;
      }
      
      private static function getCover() : Sprite
      {
         if(_cover == null)
         {
            _cover = new Sprite();
            _cover.graphics.beginFill(0,1);
            _cover.graphics.drawRect(0,0,1,1);
            _cover.graphics.endFill();
         }
         return _cover;
      }
      
      private static function get crossBtn() : Button
      {
         if(_crossBtn == null)
         {
            _crossBtn = new Button();
            _crossBtn.styleName = ".GreenButton";
            _crossBtn.label = FontHKHB.TD_Movie_Cross;
            _crossBtn.width = 85;
            _crossBtn.height = 45;
         }
         return _crossBtn;
      }
   }
}

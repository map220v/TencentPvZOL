package com.qq.modules.td.view.game.ui
{
   import asgui.controls.Label;
   import asgui.core.Application;
   import asgui.resources.AssetManager;
   import asgui.styles.StyleManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import org.as3commons.logging.api.getLogger;
   
   public class TDGameTipTextMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDGameTipTextView;
      
      private var _textMc:MovieClip;
      
      private var _textTipContainer:Sprite;
      
      private var _textTipLabel:Label;
      
      private var _textTipIntervalID:int = -1;
      
      private var _nextCommandID:int;
      
      private var txtMc:MovieClip;
      
      private var _startTime:int;
      
      private var _countDownTime:int;
      
      private var _frameSpeedCounter:int;
      
      private var _frameSpeed:int;
      
      public function TDGameTipTextMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TD_TextTip_Show,this.onTextTipShow,CommonEvent);
         addContextListener(CommandName.TD_TextTip_Hide,this.onTextTipHide,CommonEvent);
      }
      
      override public function dispose() : void
      {
         this.clean();
         super.dispose();
      }
      
      private function clean() : void
      {
         if(this._textMc != null)
         {
            this._textMc.stop();
            UtilsManager.removeFromContainer(this._textMc);
            this._textMc.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this._textMc = null;
         }
         if(this._textTipContainer != null)
         {
            removeComponentListener(GameGloble.stage,Event.RESIZE,this.onResizeTextTip);
            UtilsManager.removeFromContainer(this._textTipLabel);
            UtilsManager.removeFromContainer(this._textTipContainer);
            this._textTipLabel = null;
            this._textTipContainer = null;
            if(this._textTipIntervalID >= 0)
            {
               clearInterval(this._textTipIntervalID);
               this._textTipIntervalID = -1;
            }
         }
      }
      
      private function onTextTipShow(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.readCustomParam_String("tipTextName");
         if(_loc2_ == null)
         {
            getLogger("TD").debug("提示文字名为空");
            return;
         }
         if(this._textMc && this._textMc.name == _loc2_)
         {
            this.clean();
         }
         this.view.visible = true;
         this.clean();
         switch(_loc2_)
         {
            case "countDown":
               this.showCountDown(param1);
               break;
            default:
               this.showNormalTip(param1);
         }
         if(this._textMc != null)
         {
            this._textMc.name = _loc2_;
         }
         addComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function showCountDown(param1:CommonEvent) : void
      {
         this._startTime = TDGameInfo.getInstance().getCurGameTime();
         this._countDownTime = int(param1.readCustomParam("time"));
         this._textMc = new TDGameTipCountDown();
         this._textMc.x = Application.application.width * 0.5 - 150;
         (this._textMc as TDGameTipCountDown).countDown = this._countDownTime;
         this.view.addChild(this._textMc);
      }
      
      private function showNormalTip(param1:CommonEvent) : void
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.readCustomParam_String("tipTextName");
         var _loc3_:String = param1.readCustomParam_String("txt");
         if(_loc2_ != "TD_GUIDE_TIP")
         {
            this._textMc = AssetManager.getInstance().GetNewClass(_loc2_) as MovieClip;
            if(this._textMc == null)
            {
               getLogger("TD").debug("提示文字名动画失败" + _loc2_);
               return;
            }
            this._frameSpeedCounter = 1;
            this._frameSpeed = GameGloble.stage.frameRate / 30;
            this._textMc.gotoAndStop(1);
            this._textMc.x = Application.application.width / 2;
            this._textMc.y = Application.application.height / 2;
            this.view.addChild(this._textMc);
            if(_loc3_)
            {
               if(this.txtMc)
               {
                  this.txtMc.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
                  if(this.txtMc.parent)
                  {
                     this.txtMc.parent.removeChild(this.txtMc);
                  }
                  this.txtMc = null;
               }
               (this._textMc["mc"]["txt"]["txt"] as TextField).text = _loc3_;
               StyleManager.GetStyleDeclaration(".Guide_Show_Tip").SetTextFieldStyle(this._textMc["mc"]["txt"]["txt"] as TextField);
               this.txtMc = this._textMc;
            }
         }
         else
         {
            this.showTextTip(_loc3_);
         }
         this._nextCommandID = -1;
         if(param1.hasCustmeParam("nextCommandName"))
         {
            _loc4_ = param1.readCustomParam_String("nextCommandName");
            if(param1.hasCustmeParam("nextCommandParam"))
            {
               _loc5_ = param1.readCustomParam("nextCommandParam") as Array;
            }
            this._nextCommandID = CommandDispatcher.storeCommand(_loc4_,_loc5_);
         }
      }
      
      private function showTextTip(param1:String) : void
      {
         this._textTipContainer = new Sprite();
         this._textTipLabel = new Label();
         this._textTipLabel.height = 40;
         this._textTipLabel.x = 0;
         this._textTipLabel.y = (54 - this._textTipLabel.height) * 0.5 + 8;
         this._textTipLabel.styleName = ".Guide_Show_Tip";
         this._textTipLabel.text = param1;
         this._textTipLabel.width = GameGloble.stage.stageWidth;
         this._textTipContainer.addChild(this._textTipLabel);
         this._textTipContainer.mouseChildren = false;
         this._textTipContainer.mouseEnabled = false;
         this.view.addChild(this._textTipContainer);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.onResizeTextTip);
         this.onResizeTextTip(null);
         this._textTipIntervalID = setInterval(this.hideTextMc,8000);
      }
      
      private function onResizeTextTip(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this._textTipContainer);
         GraphicsUtils.drawRect(this._textTipContainer,0,0,GameGloble.stage.stageWidth,54,0,0.6);
         this._textTipLabel.x = (GameGloble.stage.stageWidth - this._textTipLabel.width) * 0.5;
         this._textTipContainer.y = GameGloble.stage.stageHeight - 200;
      }
      
      private function onTextTipHide(param1:CommonEvent) : void
      {
         this.view.visible = false;
         this.clean();
         UtilsManager.removeFromContainer(this._textMc);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(this._textMc == null)
         {
            return;
         }
         switch(this._textMc.name)
         {
            case "countDown":
               if(TDGameInfo.getInstance().getCurGameTime() - this._startTime > this._countDownTime)
               {
                  this.hideTextMc();
               }
               else
               {
                  (this._textMc as TDGameTipCountDown).countDown = int((this._countDownTime + this._startTime - TDGameInfo.getInstance().getCurGameTime()) * 0.001);
               }
               break;
            default:
               if(this._frameSpeedCounter >= this._frameSpeed)
               {
                  this._frameSpeedCounter = 1;
                  this._textMc.nextFrame();
                  if(this._textMc.currentFrame >= this._textMc.totalFrames)
                  {
                     this.hideTextMc();
                     if(this._nextCommandID != -1)
                     {
                        CommandDispatcher.runStoreCommand(this._nextCommandID);
                     }
                  }
               }
               else
               {
                  ++this._frameSpeedCounter;
               }
         }
      }
      
      private function hideTextMc() : void
      {
         if(this._textMc != null)
         {
            this._textMc.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         CommandDispatcher.send(CommandName.TD_TextTip_Hide);
      }
   }
}

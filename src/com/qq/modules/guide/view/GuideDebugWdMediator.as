package com.qq.modules.guide.view
{
   import PVZ.Cmd.Cmd_DoGm_CS;
   import PVZ.Cmd.Cmd_DoGm_SC;
   import com.qq.modules.main.server.PvzSocketService;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import org.robotlegs.mvcs.Mediator;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class GuideDebugWdMediator extends Mediator
   {
       
      
      [Inject]
      public var view:GuideDebugWd;
      
      [Inject]
      public var service:PvzSocketService;
      
      private var _historyVec:Vector.<String>;
      
      private var _historyIter:int = -1;
      
      public function GuideDebugWdMediator()
      {
         this._historyVec = new Vector.<String>();
         super();
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.view.GMBtn.addEventListener(MouseEvent.CLICK,this.sendGmCommandHandler);
         this.view.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
         this.service.eventDispatcher.addEventListener(Cmd_DoGm_SC.$MessageID,this.serviceHandler);
         this.view.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      private function serviceHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DoGm_SC = param1.socketData as Cmd_DoGm_SC;
         var _loc3_:String = this.view.txt.text;
         this.view.txt.text = _loc3_ + "\n" + "GM CallBack :  \n" + _loc2_.responseCmd;
         this.addGMToHistory(this.view.GMInput.text);
         this.view.GMInput.text = "";
      }
      
      private function addGMToHistory(param1:String) : void
      {
         this._historyVec.unshift(param1);
         this._historyIter = -1;
      }
      
      private function cleanHistory() : void
      {
         this._historyIter = -1;
         this._historyVec = Vector.<String>([]);
      }
      
      private function backwardHistory() : String
      {
         if(this._historyVec.length == 0 || this._historyIter >= this._historyVec.length - 1)
         {
            return "";
         }
         return this._historyVec[++this._historyIter];
      }
      
      private function forwardHistory() : String
      {
         if(this._historyVec.length == 0 || this._historyIter < 1)
         {
            return "";
         }
         return this._historyVec[--this._historyIter];
      }
      
      protected function sendGmCommandHandler(param1:MouseEvent) : void
      {
         var _loc4_:String = null;
         var _loc5_:Cmd_DoGm_CS = null;
         var _loc2_:String = this.view.GMInput.text;
         var _loc3_:Array = _loc2_.split(";");
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_ != null && _loc4_.length > 0)
            {
               (_loc5_ = new Cmd_DoGm_CS()).requestCmd = _loc4_;
               this.service.sendMessage(_loc5_);
            }
         }
      }
      
      protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:String = "";
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               this.sendGmCommandHandler(null);
               break;
            case Keyboard.UP:
               _loc2_ = this.backwardHistory();
               break;
            case Keyboard.DOWN:
               _loc2_ = this.forwardHistory();
               break;
            case Keyboard.ESCAPE:
               this.view.Close();
         }
         if(_loc2_ != "")
         {
            this.view.GMInput.text = _loc2_;
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.view.stage.focus = this.view.GMInput._textField;
      }
      
      override public function preRemove() : void
      {
         this.view.GMBtn.removeEventListener(MouseEvent.CLICK,this.sendGmCommandHandler);
         this.service.eventDispatcher.removeEventListener(Cmd_DoGm_SC.$MessageID,this.serviceHandler);
         super.preRemove();
      }
   }
}

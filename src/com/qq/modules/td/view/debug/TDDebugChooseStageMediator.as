package com.qq.modules.td.view.debug
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.debug.TDDebugCmd;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDDebugChooseStageMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDDebugChooseStage;
      
      public function TDDebugChooseStageMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.okBtn,MouseEvent.CLICK,this.onClick,MouseEvent);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc2_:int = int(this.view.inputLabel.text);
         if(_loc2_ == 0)
         {
            return;
         }
         TDDebugCmd.gotoStage(_loc2_,1);
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

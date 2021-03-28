package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.ui.TDUICmd;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class TdUiEnergyTileTrackCardMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TdUiEnergyTileTrackCard;
      
      private var _time:Number;
      
      public function TdUiEnergyTileTrackCardMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addComponentListener(GameGloble.stage,MouseEvent.MOUSE_UP,this.onMouseUp);
         addContextListener(CommandName.TD_DropEnergyTile,this.onDropEnergyTile,CommonEvent);
         this.view.buttonMode = true;
         this._time = 0;
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(getTimer() - this._time < 150)
         {
            param1.stopImmediatePropagation();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._time = getTimer();
         TDUICmd.startEnergyTileByType(this.view.energyTileData.type,this.view.energyTileId);
      }
      
      private function onDropEnergyTile(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.param as String;
         if(_loc2_ == this.view.energyTileId)
         {
            this.view.Close();
         }
      }
   }
}

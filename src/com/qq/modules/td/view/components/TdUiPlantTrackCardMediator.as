package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.ui.TDUICmd;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class TdUiPlantTrackCardMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TdUiPlantTrackCard;
      
      private var _time:Number;
      
      private var _isFlag:Boolean = false;
      
      public function TdUiPlantTrackCardMediator()
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
         addComponentListener(this.view,MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addComponentListener(GameGloble.stage,MouseEvent.MOUSE_UP,this.onMouseUp);
         addComponentListener(this.view.image_icon,MouseEvent.MOUSE_DOWN,this.onClickTrash);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
         this.view.buttonMode = true;
         this._time = 0;
      }
      
      private function onClickTrash(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.view.Close();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(getTimer() - this._time < 150)
         {
            this._isFlag = false;
            param1.stopImmediatePropagation();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._time = getTimer();
         TDUICmd.startPlantSettingByID(this.view.cardData.plantStaticInfo.type,this.view.id,true,null,false);
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.readCustomParam_String("cardID");
         var _loc3_:int = param1.readCustomParam_Number("plantType");
         if(_loc2_ != this.view.id)
         {
            return;
         }
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

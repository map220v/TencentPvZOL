package com.qq.modules.td.view.components
{
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDMiniGameShootingData;
   import com.qq.modules.td.model.TDStageInfo;
   
   public class TDWindForcePanelMediator extends BasicScreenMediator implements IAnimatable
   {
       
      
      [Inject]
      public var view:TDWindForcePanel;
      
      private var _changeInterval:int;
      
      private var passedTimeAll:Number = 0;
      
      public function TDWindForcePanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._changeInterval = int(TDStageInfo.getInstance().stageParamXml.windChangeInterval.@value);
         this.view.windForce = TDMiniGameShootingData.getInstance().windForce;
         WorldClock.clock.add(this);
      }
      
      public function advanceTime(param1:Number) : void
      {
         this.passedTimeAll += param1;
         if(this.passedTimeAll >= this._changeInterval)
         {
            this.view.windForce = TDMiniGameShootingData.getInstance().changeWind();
            this.passedTimeAll %= this._changeInterval;
         }
      }
      
      override public function dispose() : void
      {
         WorldClock.clock.remove(this);
         super.dispose();
      }
   }
}

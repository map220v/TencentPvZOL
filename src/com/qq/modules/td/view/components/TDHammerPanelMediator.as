package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   
   public class TDHammerPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDHammerPanle;
      
      public function TDHammerPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDMiniGame_TerracottaMemory_InitWave,this.updateHammer,CommonEvent);
         addContextListener(CommandName.TDMiniGame_TerracottaMemory_Smash,this.updateHammer);
      }
      
      private function updateHammer(param1:CommonEvent) : void
      {
         this.view.setHammerCount(TDMiniGameTerracottaMemoryData.getInstance().waveShockChance);
      }
   }
}

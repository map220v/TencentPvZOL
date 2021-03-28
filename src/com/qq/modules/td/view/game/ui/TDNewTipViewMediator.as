package com.qq.modules.td.view.game.ui
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.utils.UtilsManager;
   import flash.events.MouseEvent;
   
   public class TDNewTipViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDNewTipView;
      
      private var _zombieInfo:TDZombieStaticInfo;
      
      public function TDNewTipViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.img,MouseEvent.CLICK,this.onClick);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         var _loc2_:int = int(param1.zombieType);
         this._zombieInfo = TDDataFactory.instance.getZombieInfoByID(_loc2_);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this._zombieInfo != null)
         {
            TDGameCmd.showInstrustation(TDConstant.UnitCatalog_Zombie,this._zombieInfo.id);
         }
         UtilsManager.removeFromContainer(this.view);
      }
   }
}

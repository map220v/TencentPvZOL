package com.qq.modules.td.view.items.loot
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.TDItemCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TDLootRewardBagViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDLootRewardBagView;
      
      public function TDLootRewardBagViewMediator()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.CLICK,this.onCollect);
         addContextListener(CommandName.TDGameEvent_HideRewardItem,this.onHideRewardItem);
         TweenMax.to(this.view,1,{
            "colorMatrixFilter":{"brightness":0.5},
            "yoyo":true,
            "repeat":-1
         });
      }
      
      private function onCollect(param1:Event) : void
      {
         TDSoundCmd.stopTDMusic();
         TweenMax.killTweensOf(this.view);
         removeComponentListener(this.view,MouseEvent.CLICK,this.onCollect);
         var _loc2_:Point = new Point(GameGloble.stage.stageWidth * 0.5,GameGloble.stage.stageHeight * 0.5);
         _loc2_ = this.view.parent.globalToLocal(_loc2_);
         TweenMax.to(this.view,1,{
            "x":_loc2_.x,
            "y":_loc2_.y,
            "onComplete":this.onFinishBagMove
         });
      }
      
      private function onFinishBagMove() : void
      {
         var _loc1_:Point = new Point(this.view.x,this.view.y);
         _loc1_ = this.view.parent.localToGlobal(_loc1_);
         TDItemCmd.showRewardItemFromBag(_loc1_.x,_loc1_.y);
      }
      
      private function onHideRewardItem(param1:Event) : void
      {
         TweenMax.to(this.view,1,{
            "autoAlpha":0,
            "onComplete":this.onFinishFade
         });
      }
      
      private function onFinishFade() : void
      {
         UtilsManager.removeFromContainer(this.view);
      }
   }
}

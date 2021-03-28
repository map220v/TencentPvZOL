package com.qq.modules.td.view.items.loot
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Cubic;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TDLootAchievementStarViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDLootAchievementStarView;
      
      public function TDLootAchievementStarViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDGameEvent_FlyRewardItem,this.onFlyRewardItem);
      }
      
      private function onFlyRewardItem(param1:Event) : void
      {
         var _loc2_:Point = new Point(GameGloble.stage.stageWidth + TDConstant.RewardFlyTargetRB_OffsetX,GameGloble.stage.stageHeight + TDConstant.RewardFlyTargetRB_OffsetY);
         if(this.view.parent != null)
         {
            _loc2_ = this.view.parent.globalToLocal(_loc2_);
         }
         TweenMax.to(this.view,5,{
            "x":_loc2_.x,
            "y":_loc2_.y,
            "scaleX":0.6,
            "scaleY":0.6,
            "delay":2,
            "onStart":this.onStartMove,
            "onComplete":this.onFinishMove,
            "ease":Cubic.easeIn
         });
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.view.rotation += 2;
      }
      
      private function onStartMove() : void
      {
         addComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onFinishMove() : void
      {
         removeComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
         TweenMax.to(this.view,1,{
            "autoAlpha":0,
            "onComplete":this.onFinishFade
         });
         UISoundCmd.collect_star();
      }
      
      private function onFinishFade() : void
      {
         UtilsManager.removeFromContainer(this.view);
      }
   }
}

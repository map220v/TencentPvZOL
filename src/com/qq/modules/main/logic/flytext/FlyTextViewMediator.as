package com.qq.modules.main.logic.flytext
{
   import com.greensock.TweenMax;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.utils.DMath;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   
   public class FlyTextViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:FlyTextView;
      
      public function FlyTextViewMediator()
      {
         super();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         super.reset(param1);
         var _loc2_:String = param1 as String;
         this.view.text.text = _loc2_;
         switch(this.view.flyType)
         {
            case FlyTextType.FLY_TYPE_LAB_UPGRADE:
               _loc3_ = 1;
               _loc5_ = 1;
               _loc4_ = this.view.y - 50;
               _loc6_ = 50;
               TweenMax.to(this.view,_loc3_,{"y":_loc4_});
               TweenMax.to(this.view,_loc3_,{
                  "y":_loc4_ - _loc6_,
                  "alpha":0,
                  "delay":_loc5_,
                  "onComplete":this.onEffectFinish
               });
               break;
            case FlyTextType.FLY_TYPE_GOLD_EXCHANGE:
               this.view.alpha = 1;
               _loc3_ = 2;
               TweenMax.to(this.view,_loc3_,{
                  "y":this.view.y - 150,
                  "alpha":0.5,
                  "onComplete":this.onEffectFinish
               });
               break;
            default:
               _loc3_ = 2;
               _loc5_ = 2;
               _loc4_ = this.view.y - FlyTextView.FlyDistance + DMath.randNum(-50,50);
               _loc6_ = FlyTextView.FlyDistance;
               TweenMax.to(this.view,_loc3_,{"y":_loc4_});
               TweenMax.to(this.view,_loc3_,{
                  "y":_loc4_ - _loc6_,
                  "alpha":0.5,
                  "delay":_loc5_,
                  "onComplete":this.onEffectFinish
               });
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.view.Dispose();
      }
      
      private function onEffectFinish(... rest) : void
      {
         UtilsManager.removeFromContainer(this.view);
      }
   }
}

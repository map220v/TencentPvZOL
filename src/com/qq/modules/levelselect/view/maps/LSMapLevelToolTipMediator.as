package com.qq.modules.levelselect.view.maps
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import flash.events.Event;
   
   public class LSMapLevelToolTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSMapLevelToolTip;
      
      [Inject]
      public var proxy:LSProxy;
      
      public function LSMapLevelToolTipMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.addEventListener(Event.CHANGE,this.changeHandler,false,0,true);
      }
      
      protected function changeHandler(param1:Event) : void
      {
         var _loc3_:LSMapLevelIconStar = null;
         var _loc5_:int = 0;
         var _loc2_:LSLevelInfoVO = this.proxy.getLevelInfo(this.view.levelId,this.view.subLevelId);
         this.view.txtPowerHas.text = "";
         var _loc4_:int = !!_loc2_.achievementList ? int(_loc2_.achievementList.length) : 0;
         var _loc6_:int = 80 / (_loc2_.template.achievementList.length + 1);
         while(this.view.boxAchi.numChildren < _loc2_.template.achievementList.length)
         {
            _loc3_ = new LSMapLevelIconStar();
            this.view.boxAchi.addChild(_loc3_);
         }
         _loc5_ = 0;
         while(_loc5_ < this.view.boxAchi.numChildren)
         {
            _loc3_ = this.view.boxAchi.getChildAt(_loc5_) as LSMapLevelIconStar;
            if(_loc5_ < _loc4_)
            {
               _loc3_.setEnable(true);
            }
            else
            {
               _loc3_.setEnable(false);
            }
            _loc5_++;
         }
      }
   }
}

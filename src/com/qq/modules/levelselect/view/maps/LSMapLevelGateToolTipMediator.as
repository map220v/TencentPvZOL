package com.qq.modules.levelselect.view.maps
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.model.templates.LSGateTemplate;
   
   public class LSMapLevelGateToolTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSMapLevelGateToolTip;
      
      public function LSMapLevelGateToolTipMediator()
      {
         super();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:LSGateTemplate = null;
         if(param1 is LSGateTemplate)
         {
            _loc2_ = param1 as LSGateTemplate;
            this.view.txt.text = _loc2_.getUnlockTip();
         }
         else if(param1 is String)
         {
            this.view.txt.text = param1 as String;
         }
      }
   }
}

package com.qq.modules.td.logic.unit.object
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.utils.UrlManager;
   import flash.geom.Rectangle;
   import flash.utils.setTimeout;
   
   public class TDSwitcher extends TDNormalObject
   {
       
      
      public function TDSwitcher()
      {
         super();
         this.setAction(TDConstant.SwitcherActionIdle);
         this.setAction(TDConstant.SwitcherActionRun);
         setTimeout(this.initDelay,200);
      }
      
      private function initDelay() : void
      {
         var _loc1_:Rectangle = TDCheckCollision.getNewObjRect(this,new Rectangle());
         var _loc2_:int = _loc1_.x;
         var _loc3_:int = _loc1_.y + _loc1_.height * 0.5;
         TDEffectCmd.playClipAt(UrlManager.getUrl(UrlManager.Url_TD_EFFECTS,"objects/switcher_bottom.swf"),_loc2_,_loc3_,true,"bottom",false,null,false);
      }
      
      override public function get damageArea() : Rectangle
      {
         return super.damageArea;
      }
      
      override public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         super.setAction(param1,param2,param3);
      }
   }
}

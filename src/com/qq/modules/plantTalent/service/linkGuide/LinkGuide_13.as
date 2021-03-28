package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.CommandName;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.talent.constant.TalentAdvancedConditionType;
   import com.qq.utils.CommandDispatcher;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class LinkGuide_13 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_13()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.WT);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
      
      private function onLinkGuideHandler(param1:CommonEvent) : void
      {
         var disObj:DisplayObject = null;
         var t:int = 0;
         var event:CommonEvent = param1;
         if(event.param.type == TalentAdvancedConditionType.WT_LEVEL)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
            disObj = event.param.dis;
            t = setTimeout(function():void
            {
               clearTimeout(t);
               LinkGuideView.instance.showGuide(disObj.parent,new Rectangle(disObj.x - 5,disObj.y - 5,disObj.width + 10,disObj.height + 10),"提升世界树等级",LinkGuideView.DIR_UP);
            },300);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
   }
}

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
   
   public class LinkGuide_21 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_21()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.City);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
      
      private function onLinkGuideHandler(param1:CommonEvent) : void
      {
         var disObj:DisplayObject = null;
         var t:int = 0;
         var event:CommonEvent = param1;
         if(event.param.type == TalentAdvancedConditionType.HAS_JOINED_UNION)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
            disObj = event.param.dis;
            t = setTimeout(function():void
            {
               clearTimeout(t);
               LinkGuideView.instance.showGuide(disObj.parent.parent,new Rectangle(disObj.x - 80,disObj.y - 140,disObj.width + 100,disObj.height + 160),"加入联盟",LinkGuideView.DIR_LEFT);
            },300);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
   }
}

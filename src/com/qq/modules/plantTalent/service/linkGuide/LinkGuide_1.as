package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.strengthen.command.StrengthenViewCmd;
   import com.qq.modules.td.logic.talent.constant.TalentAdvancedConditionType;
   import com.qq.utils.CommandDispatcher;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class LinkGuide_1 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_1()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         StrengthenViewCmd.openWindow();
         CommandDispatcher._dispatcher.addEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
      
      private function onLinkGuideHandler(param1:CommonEvent) : void
      {
         var disObj:DisplayObject = null;
         var t:int = 0;
         var event:CommonEvent = param1;
         if(event.param.type == TalentAdvancedConditionType.POWER)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
            disObj = event.param.dis;
            t = setTimeout(function():void
            {
               clearTimeout(t);
               LinkGuideView.instance.showGuide(disObj.parent.parent,new Rectangle(disObj.x + 10,disObj.y + 10,disObj.width,disObj.height),"了解如何提升战力",LinkGuideView.DIR_RIGHT);
            },300);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TALENT_LINK_GUIDE,this.onLinkGuideHandler);
      }
   }
}

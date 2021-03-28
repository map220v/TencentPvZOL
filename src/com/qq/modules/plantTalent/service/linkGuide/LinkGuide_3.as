package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.modules.quest.command.QuestCmd;
   
   public class LinkGuide_3 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_3()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         QuestCmd.openQuestWindow();
      }
      
      override public function dispose() : void
      {
      }
   }
}

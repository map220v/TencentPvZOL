package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.modules.main.command.GameFlowCmd;
   
   public class LinkGuide_23 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_23()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         GameFlowCmd.gotoMap();
      }
      
      override public function dispose() : void
      {
      }
   }
}

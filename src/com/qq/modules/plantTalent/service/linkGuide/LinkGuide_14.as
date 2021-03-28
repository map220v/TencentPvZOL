package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.modules.main.command.GameFlowCmd;
   
   public class LinkGuide_14 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_14()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         GameFlowCmd.gotoFuben();
      }
      
      override public function dispose() : void
      {
      }
   }
}

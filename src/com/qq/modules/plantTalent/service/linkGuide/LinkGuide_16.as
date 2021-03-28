package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   
   public class LinkGuide_16 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_16()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.TrialRoad);
      }
      
      override public function dispose() : void
      {
      }
   }
}

package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   
   public class LinkGuide_22 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_22()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.Nutrition);
      }
      
      override public function dispose() : void
      {
      }
   }
}

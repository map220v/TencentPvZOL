package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   
   public class LinkGuide_20 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_20()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.ZombieIsland);
      }
      
      override public function dispose() : void
      {
      }
   }
}

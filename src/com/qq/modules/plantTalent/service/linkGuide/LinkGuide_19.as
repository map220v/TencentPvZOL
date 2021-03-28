package com.qq.modules.plantTalent.service.linkGuide
{
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   
   public class LinkGuide_19 extends BasicLinkGuide implements ILinkGuide
   {
       
      
      public function LinkGuide_19()
      {
         super();
      }
      
      override public function linkTo() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.RANK_ARENA);
      }
      
      override public function dispose() : void
      {
      }
   }
}

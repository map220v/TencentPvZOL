package com.qq.modules.guide.view
{
   import com.qq.modules.guide.view.components.GuideChooseGameTypeWindowCE;
   
   public class GuideChooseGameTypeWindow extends GuideChooseGameTypeWindowCE
   {
       
      
      public function GuideChooseGameTypeWindow()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         setTitleBG(true);
         btnClose.visible = false;
      }
   }
}

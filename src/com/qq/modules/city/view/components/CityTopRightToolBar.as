package com.qq.modules.city.view.components
{
   import asgui.controls.Button;
   import com.qq.display.QCanvas;
   
   public class CityTopRightToolBar extends QCanvas
   {
       
      
      public var music_muteBtn:Button;
      
      public var music_playBtn:Button;
      
      public var soundEff_muteBtn:Button;
      
      public var soundEff_playBtn:Button;
      
      public function CityTopRightToolBar()
      {
         super(CityTopRightToolBarMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:QCanvas = null;
         super.InitializeComponent();
         _loc1_ = new QCanvas();
         this.music_muteBtn = new Button();
         this.music_muteBtn.width = 34;
         this.music_muteBtn.height = 32;
         this.music_muteBtn.styleName = ".Button_Menu_Music_Mute";
         this.music_muteBtn.toolTip = "音乐关";
         _loc1_.addChild(this.music_muteBtn);
         this.music_playBtn = new Button();
         this.music_playBtn.width = 34;
         this.music_playBtn.height = 32;
         this.music_playBtn.styleName = ".Button_Menu_Music_Play";
         this.music_playBtn.toolTip = "音乐开";
         _loc1_.addChild(this.music_playBtn);
         this.soundEff_muteBtn = new Button();
         this.soundEff_muteBtn.width = 34;
         this.soundEff_muteBtn.height = 32;
         this.soundEff_muteBtn.x = 33;
         this.soundEff_muteBtn.styleName = ".Button_Menu_SoundEff_Mute";
         this.soundEff_muteBtn.toolTip = "音效关";
         _loc1_.addChild(this.soundEff_muteBtn);
         this.soundEff_playBtn = new Button();
         this.soundEff_playBtn.width = 34;
         this.soundEff_playBtn.height = 32;
         this.soundEff_playBtn.x = 33;
         this.soundEff_playBtn.styleName = ".Button_Menu_SoundEff_Play";
         this.soundEff_playBtn.toolTip = "音效开";
         _loc1_.addChild(this.soundEff_playBtn);
         addChild(_loc1_);
      }
   }
}

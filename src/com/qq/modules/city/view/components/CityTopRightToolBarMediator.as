package com.qq.modules.city.view.components
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.utils.db.ShareObjectConst;
   import com.qq.utils.db.ShareObjectDB;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class CityTopRightToolBarMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:CityTopRightToolBar;
      
      private var _isMusicMute:Boolean;
      
      private var _isSoundEffMute:Boolean;
      
      public function CityTopRightToolBarMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.setCityUIVisible,this.onSetCityUIVisible);
         addComponentListener(this.view.music_muteBtn,MouseEvent.CLICK,this.onClickMusicMuteBtn);
         addComponentListener(this.view.music_playBtn,MouseEvent.CLICK,this.onClickMusicMuteBtn);
         addComponentListener(this.view.soundEff_muteBtn,MouseEvent.CLICK,this.onClickSoundEffMuteBtn);
         addComponentListener(this.view.soundEff_playBtn,MouseEvent.CLICK,this.onClickSoundEffMuteBtn);
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this._isMusicMute = Boolean(ShareObjectDB.getInstance().readData(ShareObjectConst.KEY_IsMute,false));
         this._isSoundEffMute = Boolean(ShareObjectDB.getInstance().readData(ShareObjectConst.KEY_SoundEffect_IsMute,false));
         this.refresh();
      }
      
      private function refresh() : void
      {
         this.view.music_muteBtn.visible = this._isMusicMute;
         this.view.music_playBtn.visible = !this.view.music_muteBtn.visible;
         this.view.soundEff_muteBtn.visible = this._isSoundEffMute;
         this.view.soundEff_playBtn.visible = !this.view.soundEff_muteBtn.visible;
      }
      
      private function onSetCityUIVisible(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.param);
         this.view.visible = _loc2_;
      }
      
      private function onClickMusicMuteBtn(param1:Event) : void
      {
         this._isMusicMute = !this._isMusicMute;
         SoundCmd.setMusicMute(this._isMusicMute);
         this.refresh();
      }
      
      private function onClickSoundEffMuteBtn(param1:Event) : void
      {
         this._isSoundEffMute = !this._isSoundEffMute;
         SoundCmd.setSoundEffMute(this._isSoundEffMute);
         this.refresh();
      }
   }
}

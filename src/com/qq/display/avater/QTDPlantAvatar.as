package com.qq.display.avater
{
   import asgui.blit.bone.BlitBoneManager;
   import com.qq.GameGloble;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.QBlitBoneUtil;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class QTDPlantAvatar extends QBasicTDAvater
   {
       
      
      private var _plantInfo:TDPlantStaticInfo;
      
      public function QTDPlantAvatar()
      {
         super();
      }
      
      override public function setData(param1:int) : void
      {
         this._plantInfo = TDDataFactory.instance.getPlantInfoByID(param1);
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_TDPlantAnmi,this._plantInfo.baseInfo.resFileName + "." + GameGloble.BONE_FILE_EXT);
         _anim.data = BlitBoneManager.impl.getBoneDataByUrl(_loc2_);
         if(!_anim.data.hasLoaded)
         {
            _anim.data.addEventListener(Event.COMPLETE,this.onLoadComplete);
         }
         else
         {
            play();
         }
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         if(_anim != null && _anim.data != null)
         {
            _anim.data.removeEventListener(Event.COMPLETE,this.onLoadComplete);
         }
         if(this._plantInfo == null)
         {
            return;
         }
         this.initHideBones();
         play();
      }
      
      override protected function initHideBones() : void
      {
         super.initHideBones();
         QBlitBoneUtil.useDefaultAvatar(_anim,this._plantInfo.id,false);
      }
      
      override public function Dispose() : void
      {
         if(_anim != null && _anim.data != null)
         {
            _anim.data.removeEventListener(Event.COMPLETE,this.onLoadComplete);
         }
         this._plantInfo = null;
         super.Dispose();
      }
   }
}

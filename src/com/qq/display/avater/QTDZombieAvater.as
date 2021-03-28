package com.qq.display.avater
{
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class QTDZombieAvater extends QBasicTDAvater
   {
       
      
      private var _zombieInfo:TDZombieStaticInfo;
      
      public function QTDZombieAvater()
      {
         super();
      }
      
      override public function setData(param1:int) : void
      {
         this._zombieInfo = TDDataFactory.instance.getZombieInfoByID(param1);
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_TDZombieAnmi,this._zombieInfo.resFileName + "." + GameGloble.BONE_FILE_EXT);
         _anim.data = BlitBoneManager.impl.getBoneDataByUrl(_loc2_);
         if(!_anim.data.hasLoaded)
         {
            _anim.data.addEventListener(Event.COMPLETE,this.onLoadComplete);
         }
         else
         {
            this.play();
         }
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         this.play();
      }
      
      override protected function play() : void
      {
         this.initHideBones();
         super.play();
      }
      
      override protected function initHideBones() : void
      {
         var _loc1_:IBlitDisplayObject = null;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         super.initHideBones();
         if(this._zombieInfo.InitHideBones)
         {
            _loc2_ = 0;
            while(_loc2_ < this._zombieInfo.InitHideBones.length)
            {
               _loc3_ = this._zombieInfo.InitHideBones[_loc2_];
               _anim.setBoneVisibleRule(_loc3_,false);
               _loc2_++;
            }
         }
         _anim.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
         _anim.setBoneVisibleRule(TDConstant.Ground_LayerName2,false);
      }
      
      override public function Dispose() : void
      {
         this._zombieInfo = null;
         super.Dispose();
      }
   }
}

package com.qq.sound
{
   import com.qq.modules.sound.model.templates.ce.SoundInfoTemplateCE;
   import com.qq.utils.UrlManager;
   
   public class AudioSource
   {
      
      public static const SOUNDTYPE_SWF:int = 0;
      
      public static const SOUNDTYPE_MUSIC_FILE:int = 1;
       
      
      public var id:int;
      
      public var souceType:int;
      
      public var url:String;
      
      public var moduleID:int;
      
      public var maxSound:int;
      
      public var volume:Number;
      
      public function AudioSource(param1:SoundInfoTemplateCE)
      {
         var _loc2_:int = 0;
         super();
         if(param1.url.indexOf(".swf") != -1)
         {
            _loc2_ = AudioSource.SOUNDTYPE_SWF;
         }
         else
         {
            _loc2_ = AudioSource.SOUNDTYPE_MUSIC_FILE;
         }
         var _loc3_:String = UrlManager.getInstance().getUrl(UrlManager.Url_Sound,param1.url);
         this.url = _loc3_;
         this.souceType = _loc2_;
         this.moduleID = param1.moduleID;
         this.maxSound = param1.maxSound;
         this.id = param1.id;
         this.volume = param1.volume * 0.01;
      }
      
      public function get key() : String
      {
         return this.url + this.moduleID + "_" + this.id;
      }
   }
}

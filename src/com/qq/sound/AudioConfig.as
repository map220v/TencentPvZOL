package com.qq.sound
{
   import com.qq.modules.sound.model.templates.ce.SoundInfoTemplateCE;
   
   public class AudioConfig
   {
       
      
      public var isLoop:Boolean;
      
      public var existTime:int;
      
      public var vaildPlayTimeLimit:int;
      
      public var isFadeOut:Boolean;
      
      public var loopInsideData:Array;
      
      public var soundFlag:int;
      
      public function AudioConfig(param1:SoundInfoTemplateCE, param2:int, param3:int = 60000, param4:int = 1500)
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         super();
         this.soundFlag = param2;
         this.isLoop = param1.isLoop == 1;
         this.existTime = param3;
         this.vaildPlayTimeLimit = param4;
         if(param1.loopEffect != null && param1.loopEffect.length > 0)
         {
            _loc5_ = param1.loopEffect.split(";");
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               if((_loc8_ = (_loc7_ = _loc5_[_loc6_]).split(":")).length == 2)
               {
                  if(this.loopInsideData == null)
                  {
                     this.loopInsideData = new Array();
                  }
                  _loc8_[0] *= 1000;
                  _loc8_[1] *= 1000;
                  this.loopInsideData.push(_loc8_);
               }
               _loc6_++;
            }
         }
         this.isFadeOut = param1.isFadeOut == 1;
      }
      
      public function get isBackSound() : Boolean
      {
         return this.isLoop;
      }
   }
}

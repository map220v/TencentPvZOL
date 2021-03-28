package tencent.manager
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.getTimer;
   
   public class SleepModeManager
   {
      
      private static var _instance:SleepModeManager;
       
      
      private var _curSec:Number;
      
      private var _disSec:Number;
      
      private var _lastSec:Number;
      
      private var _sound:Sound = null;
      
      public function SleepModeManager(param1:Stage)
      {
         super();
         this._lastSec = getTimer();
         param1.addEventListener(Event.ENTER_FRAME,this.onEnterFrameHandler);
         if(this._sound == null)
         {
            this._sound = new Sound(new URLRequest(""));
         }
         this._sound.play();
         this._sound.close();
      }
      
      public static function init(param1:Stage) : void
      {
         if(!_instance)
         {
            _instance = new SleepModeManager(param1);
         }
      }
      
      public static function getInstance() : SleepModeManager
      {
         return _instance;
      }
      
      public function startPlay() : void
      {
         this._sound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleDataHandler,false,0,true);
         this._sound.play();
      }
      
      public function stopPlay() : void
      {
         this._sound.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleDataHandler);
      }
      
      public function onSampleDataHandler(param1:SampleDataEvent) : void
      {
         param1.data.position = param1.data.length = 4096 * 4;
      }
      
      private function onEnterFrameHandler(param1:Event) : void
      {
         this._curSec = getTimer();
         this._disSec = this._curSec - this._lastSec;
         if(this._disSec < 500)
         {
         }
         this._lastSec = this._curSec;
      }
   }
}

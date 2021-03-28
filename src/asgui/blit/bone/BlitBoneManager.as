package asgui.blit.bone
{
   import asgui.blit.Blit;
   import asgui.blit.IBlitBatchableDisplayFactory;
   import asgui.blit.IBlitDisplayFactory;
   import asgui.blit.bone.decode.BlitBoneDataAreaDecodePlugin;
   import asgui.blit.bone.decode.BlitBoneDataAssetPosPlugin;
   import asgui.blit.bone.decode.BlitBoneDataBlitDecodePlugin;
   import asgui.blit.bone.decode.BlitBoneDataFlagLabelDecodePlugin;
   import asgui.blit.bone.decode.BlitBoneDataFrameBatchDecodePlugin;
   import asgui.blit.bone.decode.BlitBoneDataFrameLabelDecodePlugin;
   import asgui.blit.bone.decode.BlitBoneDataPluginDebug;
   import asgui.blit.bone.decode.IBlitBoneDataEncodePlugin;
   import asgui.blit.data.BlitData;
   import asgui.core.IDisposable;
   import asgui.logger.Statistic;
   import asgui.logger.Statistics;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class BlitBoneManager implements IDisposable
   {
      
      public static var datas:Array = [];
      
      private static var _impl:BlitBoneManager;
       
      
      private var timer:Timer;
      
      public var boneList:Vector.<BlitBoneAnim>;
      
      private var _undefaultFactory:IBlitDisplayFactory;
      
      private var stage:Stage;
      
      public var decodePlugin:Array;
      
      public var frameRate:int;
      
      private var _hasDisposed:Boolean;
      
      private var lastTimer:int;
      
      protected var _isPreferBatch:Boolean = false;
      
      private var _handleDebugs:Array;
      
      public function BlitBoneManager(param1:int, param2:Stage = null)
      {
         this.decodePlugin = [null,new BlitBoneDataBlitDecodePlugin(),new BlitBoneDataFrameBatchDecodePlugin(),new BlitBoneDataFrameLabelDecodePlugin(),new BlitBoneDataFlagLabelDecodePlugin(),new BlitBoneDataAreaDecodePlugin(),new BlitBoneDataAssetPosPlugin()];
         super();
         this.stage = param2;
         this.frameRate = param1;
         this.boneList = new Vector.<BlitBoneAnim>();
         this.addJuggle();
      }
      
      public static function get impl() : BlitBoneManager
      {
         if(_impl == null)
         {
            _impl = new BlitBoneManager(30);
         }
         return _impl;
      }
      
      public static function setImpl(param1:BlitBoneManager) : void
      {
         _impl = param1;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this.removeJuggle();
         this.stage = null;
         this._hasDisposed = true;
      }
      
      public function clearBlitClipListPool() : void
      {
         BlitBoneFlattenedDisplaysPool.instance.clearBlitClipList();
      }
      
      public function clearAllChildren() : void
      {
         var _loc1_:int = 0;
         var _loc2_:BlitBoneAnim = null;
         this.clearBlitClipListPool();
         _loc1_ = 0;
         while(_loc1_ < this.boneList.length)
         {
            _loc2_ = this.boneList[_loc1_];
            _loc2_.Dispose();
            _loc1_++;
         }
         this.boneList.length = 0;
      }
      
      public function getChildrenUrlStatistic() : Statistics
      {
         var _loc2_:int = 0;
         var _loc3_:BlitBoneAnim = null;
         var _loc1_:Statistics = new Statistics();
         _loc2_ = 0;
         while(_loc2_ < this.boneList.length)
         {
            _loc3_ = this.boneList[_loc2_];
            _loc1_.Add(new Statistic(null,null,!!_loc3_.data ? _loc3_.data.url : "NULL"));
            _loc2_++;
         }
         return _loc1_;
      }
      
      protected function timerHandler(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         if(this.timer)
         {
            this.advanceTime(this.timer.delay);
         }
         else
         {
            this.advanceTime(_loc2_ - this.lastTimer);
         }
         this.lastTimer = _loc2_;
      }
      
      public function get isPreferBatch() : Boolean
      {
         return this._isPreferBatch;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc5_:BlitBoneAnim = null;
         this._isPreferBatch = BlitBoneManager.impl.getBlitFactory() is IBlitBatchableDisplayFactory;
         var _loc3_:int = getTimer();
         _loc2_ = 0;
         while(_loc2_ < this.boneList.length)
         {
            if((_loc5_ = this.boneList[_loc2_]).isPlaying || _loc5_.needAFrameRender)
            {
               _loc5_.advanceTime(param1);
            }
            _loc2_++;
         }
         var _loc4_:int = getTimer();
         BlitBoneAnimRenderAnalyzer.instance.addFrameCost(_loc4_ - _loc3_);
      }
      
      public function createBoneAnim(param1:int = 0) : BlitBoneAnim
      {
         return new BlitBoneAnim(this,param1);
      }
      
      protected function addJuggle() : void
      {
         this.lastTimer = getTimer();
         if(this.stage)
         {
            this.stage.addEventListener(Event.ENTER_FRAME,this.timerHandler);
         }
         else if(!this.timer)
         {
            this.timer = new Timer(int(1000 / this.frameRate));
            this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.start();
         }
      }
      
      protected function removeJuggle() : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(Event.ENTER_FRAME,this.timerHandler);
         }
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer = null;
         }
      }
      
      function addToJuggle(param1:BlitBoneAnim) : void
      {
         this.boneList.push(param1);
      }
      
      function removeFromJuggle(param1:BlitBoneAnim) : void
      {
         this.boneList.splice(this.boneList.indexOf(param1),1);
      }
      
      public function writeBytes(param1:ByteArray, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BlitData = null;
         var _loc8_:int = 0;
         BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneData_ENCODE_START,[]);
         var _loc4_:ByteArray = new ByteArray();
         _loc8_ = 32;
         param1.writeShort(BlitBone.FILE_TYPE_TAG_BBONE);
         param1.writeShort(_loc8_);
         param1.writeShort(4);
         param1.writeByte(this.frameRate);
         param1.writeByte(1);
         param1.writeInt(0);
         param1.writeByte(1);
         while(param1.length < _loc8_)
         {
            param1.writeByte(0);
         }
         this.writeBody(_loc4_,param2);
         var _loc9_:int = _loc4_.length;
         param1.position = 8;
         param1.writeInt(_loc9_);
         param1.position = param1.length;
         _loc4_.position = 0;
         _loc4_.compress();
         _loc4_.position = 0;
         param1.writeBytes(_loc4_);
      }
      
      public function writeBody(param1:ByteArray, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:IBlitBoneDataEncodePlugin = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc4_:int = param2.length * 9 + 1;
         var _loc5_:ByteArray = new ByteArray();
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc6_ = param2[_loc3_][0];
            _loc7_ = param2[_loc3_][1];
            if(_loc8_ = BlitBoneManager.impl.decodePlugin[_loc6_])
            {
               _loc9_ = _loc5_.position;
               _loc8_.writeBytes(_loc5_,_loc7_);
               _loc10_ = _loc5_.position - _loc9_;
               param1.writeByte(_loc6_);
               param1.writeUnsignedInt(_loc9_);
               param1.writeUnsignedInt(_loc10_);
            }
            _loc3_++;
         }
         param1.writeByte(0);
         _loc5_.position = 0;
         param1.writeBytes(_loc5_);
      }
      
      public function clearAllBoneDataCache(param1:int, param2:Function = null) : void
      {
         var _loc4_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:BlitBoneData = null;
         var _loc3_:int = getTimer();
         var _loc5_:Array = [];
         for(_loc6_ in datas)
         {
            _loc5_.push(_loc6_);
         }
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc7_ = datas[_loc5_[_loc4_]];
            if(!(param1 > 0 && _loc3_ - _loc7_.accessTime < param1))
            {
               if(!(param2 != null && !param2(_loc7_)))
               {
                  _loc7_.Dispose();
                  delete datas[_loc5_[_loc4_]];
               }
            }
            _loc4_++;
         }
      }
      
      public function getBoneDataByUrl(param1:String, param2:Boolean = true) : BlitBoneData
      {
         var _loc3_:BlitBoneData = null;
         if(datas[param1] == null || (datas[param1] as BlitBoneData).hasDisposed)
         {
            _loc3_ = new BlitBoneData(param1,param2);
            _loc3_.loadUrl(param1);
            datas[param1] = _loc3_;
         }
         return datas[param1];
      }
      
      public function dispatchDebug(param1:int, param2:Array) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(this._handleDebugs && this._handleDebugs[param1])
         {
            _loc3_ = this._handleDebugs[param1];
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               (_loc3_[_loc4_] as Function).apply(null,param2);
               _loc4_++;
            }
         }
      }
      
      public function handleDebug(param1:int, param2:Function) : void
      {
         if(this._handleDebugs == null)
         {
            this._handleDebugs = [];
         }
         if(this._handleDebugs[param1] == null)
         {
            this._handleDebugs[param1] = [];
         }
         var _loc3_:Array = this._handleDebugs[param1];
         _loc3_.push(param2);
      }
      
      public function setUndefaultBlitFactory(param1:IBlitDisplayFactory) : void
      {
         this._undefaultFactory = param1;
      }
      
      public function getBlitFactory(param1:int = 0) : IBlitDisplayFactory
      {
         if(param1 & BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY && this._undefaultFactory != null)
         {
            return this._undefaultFactory;
         }
         return Blit.factory;
      }
   }
}

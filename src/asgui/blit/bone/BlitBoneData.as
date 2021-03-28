package asgui.blit.bone
{
   import asgui.blit.Blit;
   import asgui.blit.bone.decode.IBlitBoneDataEncodePlugin;
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import asgui.blit.bone.rules.BlitBoneVisibleRule;
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollector;
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollectorManager;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayContainerBatch;
   import asgui.core.IDisposable;
   import asgui.core.UIComponentGlobals;
   import asgui.logger.AsguiLogger;
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class BlitBoneData extends EventDispatcher implements IDisposable
   {
       
      
      public var frameRate:int = 0;
      
      private var decodeDataAfterLoadImmediately:Boolean;
      
      private var quadBatchesWithHidden:Array;
      
      public var partOuterBindRuleDatas:Array;
      
      public var blits:Array;
      
      public var frameBatch:Vector.<BlitBoneFrameBatch>;
      
      public var frameLabel:Vector.<FrameLabel>;
      
      public var flagLabel:Array;
      
      public var attackArea:Array;
      
      public var damageArea:Array;
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      public var swfScaleNum:Number = 1;
      
      public var url:String;
      
      public var version:int;
      
      public var partOuterBindRuleDataAutoMergeTexture:Boolean = false;
      
      var accessTime:int;
      
      private var _hasLoaded:Boolean;
      
      private var _allowInstead:Boolean;
      
      private var _insteadUrl:String;
      
      private var _hasDisposed:Boolean;
      
      public var completeWaiting:Array;
      
      public var bitmapDatas:Array;
      
      private var partUrlsWaitForLoad:Vector.<String>;
      
      public function BlitBoneData(param1:String, param2:Boolean)
      {
         this.partOuterBindRuleDatas = [];
         this.blits = [];
         this.frameBatch = new Vector.<BlitBoneFrameBatch>();
         this.frameLabel = new Vector.<FrameLabel>();
         this.flagLabel = [];
         this.attackArea = [];
         this.damageArea = [];
         this.completeWaiting = [];
         this.bitmapDatas = [];
         this.partUrlsWaitForLoad = new Vector.<String>();
         super();
         this.decodeDataAfterLoadImmediately = param2;
         this.url = param1;
         this.accessTime = getTimer();
      }
      
      public function get hasLoaded() : Boolean
      {
         return this._hasLoaded;
      }
      
      public function loadBlitsAndFrameBatch(param1:Array, param2:Vector.<BlitBoneFrameBatch>, param3:Vector.<FrameLabel>, param4:Array = null, param5:Array = null, param6:Array = null) : void
      {
         this.blits = param1;
         this.frameBatch = param2;
         this.frameLabel = param3;
         this.flagLabel = !!param4 ? param4 : [];
         this.attackArea = !!param5 ? param5 : [];
         this.damageArea = !!param6 ? param6 : [];
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function getAttackAreaByFrame(param1:int) : Array
      {
         var _loc2_:Array = this.attackArea[param1];
         if(_loc2_ == null)
         {
            _loc2_ = [0,0,0,0];
         }
         return _loc2_;
      }
      
      public function getDamageAreaByFrame(param1:int) : Array
      {
         var _loc2_:Array = this.damageArea[param1];
         if(_loc2_ == null)
         {
            _loc2_ = [0,0,0,0];
         }
         return _loc2_;
      }
      
      public function Dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:BlitData = null;
         if(!this.hasDisposed)
         {
            this.clearQuadBatchCache();
            this.bitmapDatas = null;
            this.quadBatchesWithHidden = null;
            for each(_loc3_ in this.blits)
            {
               BlitDataManager.CleanAndDisposeBlitData(_loc3_);
            }
            this.blits = null;
            this.frameBatch = null;
            this.frameLabel = null;
            this.flagLabel = null;
            this.attackArea = null;
            this.damageArea = null;
            this.partOuterBindRuleDatas = null;
            this._hasDisposed = true;
         }
      }
      
      public function getFrameLabelRange(param1:String) : Vector.<int>
      {
         var _loc2_:Vector.<int> = null;
         return Blit.GetFrameRangeByLabel(param1,this.frameLabel,this.totalFrames);
      }
      
      public function getChildFrameArray(param1:String, param2:String) : Vector.<BlitBoneFrameChild>
      {
         var _loc3_:int = 0;
         var _loc5_:Vector.<int> = null;
         var _loc6_:BlitBoneFrameChild = null;
         if(param2 == null)
         {
            return null;
         }
         var _loc4_:Vector.<BlitBoneFrameChild> = new Vector.<BlitBoneFrameChild>();
         if(int(param2.replace("-","")) > 0)
         {
            _loc5_ = Vector.<int>(param2.split("-"));
         }
         else
         {
            _loc5_ = Blit.GetFrameRangeByLabel(param2,this.frameLabel,this.totalFrames);
         }
         if(this.frameBatch == null)
         {
            return null;
         }
         if(_loc5_ == null)
         {
            return null;
         }
         _loc3_ = _loc5_[0] - 1;
         while(_loc3_ < _loc5_[1])
         {
            if(_loc6_ = this.frameBatch[_loc3_].getChildByName(param1))
            {
               _loc4_.push(_loc6_);
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function get totalFrames() : int
      {
         return this.frameBatch.length;
      }
      
      public function getFrameChild(param1:String, param2:int) : BlitBoneFrameChild
      {
         this.accessTime = getTimer();
         if(!this.hasLoaded)
         {
            return null;
         }
         return this.frameBatch[param2].getChildByName(param1);
      }
      
      public function getQuadBatchAt(param1:int, param2:IBlitDisplayContainer, param3:BlitBoneVisibleRule = null, param4:int = 0, param5:BlitBoneDataOuterBindRule = null) : IBlitDisplayContainer
      {
         var _loc6_:IBlitDisplayContainer = null;
         var _loc7_:IBlitDisplayContainerBatch = null;
         var _loc8_:BlitDisplayContainerBatchEncoderCollector = null;
         this.accessTime = getTimer();
         var _loc9_:String = param1 + "_" + (!!param3 ? param3.getRuleCurrentString() : "") + "_" + (!!param5 ? param5.getRuleCurrentString() : "");
         if(this.quadBatchesWithHidden[_loc9_] == null)
         {
            this.quadBatchesWithHidden[_loc9_] = BlitDisplayContainerBatchEncoderCollectorManager.instance.GetOrCreateCollector(this.url,_loc9_);
         }
         if(!(_loc8_ = this.quadBatchesWithHidden[_loc9_]).HasEncoder(param2.assetType))
         {
            _loc7_ = this.getFlattenedDisplaysInBatchContainerAt(param1,param3,param4,param5);
            _loc8_.SetEncoder(_loc7_.GetEncoder(),param2.assetType);
         }
         else
         {
            _loc8_.GetEncoder(param2.assetType).CheckBeforeDecode(this);
         }
         return _loc8_.GetEncoder(param2.assetType).DecodeCopy(param2);
      }
      
      public function clearQuadBatchCache() : void
      {
         var _loc1_:* = null;
         if(this.quadBatchesWithHidden)
         {
            for(_loc1_ in this.quadBatchesWithHidden)
            {
               if(this.quadBatchesWithHidden[_loc1_] != null)
               {
                  this.quadBatchesWithHidden[_loc1_] = null;
               }
            }
         }
         BlitDisplayContainerBatchEncoderCollectorManager.instance.ClearByUrl(this.url);
      }
      
      private function getFlattenedDisplaysInBatchContainerAt(param1:int, param2:BlitBoneVisibleRule = null, param3:int = 0, param4:BlitBoneDataOuterBindRule = null) : IBlitDisplayContainerBatch
      {
         var _loc5_:IBlitDisplayContainerBatch = null;
         var _loc6_:int = 0;
         var _loc9_:BlitBoneFrameChild = null;
         _loc5_ = BlitBoneManager.impl.getBlitFactory(param3).CreateBlitContainer({"batch":true}) as IBlitDisplayContainerBatch;
         var _loc7_:BlitBoneFrameBatch;
         var _loc8_:int = (_loc7_ = this.frameBatch[param1]).children.length;
         BlitBoneFlattenedDisplaysPool.instance.holdBlitClipList();
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            (_loc9_ = _loc7_.children[_loc6_]).addFlattenedDisplays(_loc5_,this,param1,param2,[],param3,null,param4);
            _loc6_++;
         }
         BlitBoneFlattenedDisplaysPool.instance.releaseBlitClipList();
         return _loc5_;
      }
      
      public function loadBytesForPart(param1:ByteArray) : void
      {
         this.loadBytes(param1);
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:BlitBoneDataOuterBindRule = null;
         var _loc14_:Vector.<Vector.<uint>> = null;
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:IBlitBoneDataEncodePlugin = null;
         var _loc19_:ByteArray = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         this.accessTime = getTimer();
         if(param1.length == 0)
         {
            AsguiLogger.Warn(this,this.url + " load failed");
            return;
         }
         var _loc2_:int = getTimer();
         var _loc7_:ByteArray = new ByteArray();
         param1.position = 0;
         var _loc8_:int = param1.readShort();
         var _loc9_:Boolean = false;
         if(_loc8_ == BlitBone.FILE_TYPE_TAG_BBONE)
         {
            _loc10_ = param1.readShort();
            this.version = param1.readShort();
            this.frameRate = param1.readByte();
            _loc11_ = param1.readByte();
            _loc12_ = param1.readInt();
            this.swfScaleNum = param1.readByte() / 100;
            param1.position = _loc10_;
            _loc9_ = true;
         }
         else if(_loc8_ == BlitBone.FILE_TYPE_TAG_OUTER_BIND_RULE)
         {
            (_loc13_ = new BlitBoneDataOuterBindRule()).blitBoneData = this;
            _loc13_.autoMergeTexture = this.partOuterBindRuleDataAutoMergeTexture;
            _loc13_.LoadBytes(param1);
            this.partOuterBindRuleDatas[_loc13_.readedRootNameForBlitBoneData + "&" + _loc13_.readedNodeNameForBlitBoneData] = _loc13_;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
         else
         {
            param1.position = 0;
            this.frameRate = 30;
            _loc9_ = true;
         }
         if(_loc9_)
         {
            _loc7_.writeBytes(param1,param1.position);
            _loc7_.position = 0;
            _loc7_.uncompress();
            _loc7_.position = 0;
            this.blits = [];
            this.frameBatch = new Vector.<BlitBoneFrameBatch>();
            this.frameLabel = new Vector.<FrameLabel>();
            this.flagLabel = [];
            this.attackArea = [];
            this.damageArea = [];
            _loc14_ = new Vector.<Vector.<uint>>();
            _loc15_ = _loc7_.readByte();
            while(_loc15_ > 0)
            {
               _loc16_ = _loc7_.readUnsignedInt();
               _loc17_ = _loc7_.readUnsignedInt();
               _loc14_.push(Vector.<uint>([_loc15_,_loc16_,_loc17_]));
               _loc15_ = _loc7_.readByte();
            }
            _loc19_ = new ByteArray();
            _loc7_.readBytes(_loc19_);
            _loc5_ = 0;
            _loc6_ = _loc14_.length;
            while(_loc5_ < _loc6_)
            {
               _loc21_ = getTimer();
               _loc15_ = _loc14_[_loc5_][0];
               _loc16_ = _loc14_[_loc5_][1];
               _loc17_ = _loc14_[_loc5_][2];
               if(BlitBoneManager.impl.decodePlugin[_loc15_] != null)
               {
                  _loc18_ = BlitBoneManager.impl.decodePlugin[_loc15_];
                  _loc22_ = 0;
                  _loc19_.position = _loc16_;
                  _loc18_.readBytes(_loc19_,this,this.version);
               }
               _loc5_++;
            }
            _loc20_ = getTimer();
            AsguiLogger.Log(this,this.url);
            AsguiLogger.Log(this,"\t\tdecode cost : \t" + (_loc20_ - _loc2_));
            AsguiLogger.Log(this,"\t\tversion : \t" + this.version);
            this.quadBatchesWithHidden = [];
            this.checkComplete();
         }
      }
      
      public function checkComplete() : void
      {
         if(this.completeWaiting.length == 0 && !this.hasLoaded)
         {
            this._hasLoaded = true;
            dispatchEvent(new Event(Event.COMPLETE));
            while(this.partUrlsWaitForLoad.length != 0)
            {
               this.loadUrl(this.partUrlsWaitForLoad.pop());
            }
         }
      }
      
      public function loadUrl(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.substring(param1.lastIndexOf("."));
         if(_loc2_ == ".bpart")
         {
            if(!this.hasLoaded)
            {
               if(this.partUrlsWaitForLoad.indexOf(param1) == -1)
               {
                  this.partUrlsWaitForLoad.push(param1);
               }
               return;
            }
            _loc5_ = (_loc4_ = param1.substring(param1.lastIndexOf("/") + 1,param1.lastIndexOf("."))).split("&");
            if(this.partOuterBindRuleDatas[_loc5_[1] + "&" + _loc5_[2]])
            {
               this.dispatchEvent(new Event(Event.CHANGE));
               return;
            }
         }
         var _loc3_:LoaderCollection = LoaderManager.GetLoaderCollection(param1,false,0);
         if(_loc3_.hasClosed)
         {
            if(this.decodeDataAfterLoadImmediately)
            {
               this.loadBytes(_loc3_.data);
            }
            else if(_loc2_ == ".bpart")
            {
               this.loadBytesForPart(_loc3_.data);
            }
            else
            {
               UIComponentGlobals.layoutManager.AdddDelayFuncCallOnce(this.loadBytes,[_loc3_.data]);
            }
         }
         else
         {
            _loc3_.addEventListener(Event.CLOSE,this.lcComplateHandler);
         }
      }
      
      protected function lcComplateHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.lcComplateHandler);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeBytes((param1.currentTarget as LoaderCollection).data);
         if(_loc2_.length == 0)
         {
            AsguiLogger.Warn(this,"load res empty error : " + this.url);
            if(this._allowInstead)
            {
               this.loadUrl(this._insteadUrl);
            }
            return;
         }
         if(this.decodeDataAfterLoadImmediately || _loc2_.length < 50000)
         {
            this.loadBytes(_loc2_);
         }
         else
         {
            UIComponentGlobals.layoutManager.AdddDelayFuncCallOnce(this.loadBytes,[_loc2_]);
         }
      }
      
      public function allowInsteadZombie(param1:String) : void
      {
         this._allowInstead = true;
         this._insteadUrl = param1;
      }
   }
}

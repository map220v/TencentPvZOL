package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitFrameData;
   import asgui.serialization.graphics.EncoderUtil;
   import asgui.utils.TextureUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataBlitDecodePlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      private var tmpForJpgLoad:Array;
      
      public function BlitBoneDataBlitDecodePlugin()
      {
         this.tmpForJpgLoad = [];
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:BlitData = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:uint = 0;
         var _loc12_:int = 0;
         var _loc13_:ByteArray = null;
         var _loc14_:Loader = null;
         var _loc15_:int = 0;
         var _loc6_:int;
         if((_loc6_ = param1.readByte()) == -1)
         {
            _loc7_ = param1.readShort();
            param2.bitmapDatas = [];
            while(_loc7_-- > 0)
            {
               _loc9_ = param1.readShort();
               _loc10_ = param1.readShort();
               _loc4_ = new BitmapData(_loc9_,_loc10_,true,0);
               if((_loc11_ = param1.readUnsignedShort()) == 65495)
               {
                  _loc12_ = param1.readUnsignedInt();
                  _loc13_ = new ByteArray();
                  param1.readBytes(_loc13_,0,_loc12_);
                  _loc13_.position = 0;
                  (_loc14_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.jpgCompleteHandler);
                  _loc14_.loadBytes(_loc13_);
                  this.tmpForJpgLoad[_loc14_.contentLoaderInfo] = param2;
                  param2.completeWaiting.push(_loc14_.contentLoaderInfo);
               }
               else
               {
                  param1.position -= 2;
                  _loc4_.setPixels(new Rectangle(0,0,_loc9_,_loc10_),param1);
               }
               param2.bitmapDatas.push(_loc4_);
               BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataBlitDecodePlugin_ReadEveryBitmapData,[_loc4_]);
            }
            _loc8_ = param1.readShort();
            while(_loc8_-- > 0)
            {
               (_loc5_ = new BlitData()).SetContent(param1,param2.bitmapDatas);
               _loc5_.url = param2.url;
               param2.blits[_loc5_.name] = _loc5_;
            }
         }
         else
         {
            --param1.position;
            _loc15_ = param1.readInt();
            while(_loc15_-- > 0)
            {
               (_loc5_ = new BlitData()).SetContent(param1);
               param2.blits[_loc5_.name] = _loc5_;
            }
         }
      }
      
      protected function jpgCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.jpgCompleteHandler);
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:BlitBoneData = this.tmpForJpgLoad[_loc2_];
         var _loc4_:int = _loc3_.completeWaiting.indexOf(_loc2_);
         var _loc5_:BitmapData = _loc3_.bitmapDatas[_loc4_];
         var _loc6_:Bitmap = _loc2_.content as Bitmap;
         _loc5_.copyPixels(_loc6_.bitmapData,_loc6_.bitmapData.rect,new Point());
         _loc3_.completeWaiting.splice(_loc4_,1);
         this.tmpForJpgLoad[_loc2_] = null;
         _loc3_.checkComplete();
      }
      
      public function writeBytes2(param1:ByteArray, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:BlitData = null;
         var _loc7_:ByteArray = null;
         var _loc5_:Array = param2;
         var _loc6_:int = 0;
         for each(_loc4_ in _loc5_)
         {
            _loc6_++;
         }
         param1.writeInt(_loc6_);
         for each(_loc4_ in _loc5_)
         {
            _loc7_ = _loc4_.GetContentBytes();
            param1.writeBytes(_loc7_);
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BlitData = null;
         var _loc8_:BitmapData = null;
         var _loc11_:BlitFrameData = null;
         var _loc16_:Vector.<BitmapData> = null;
         var _loc17_:ByteArray = null;
         var _loc18_:int = 0;
         var _loc19_:ByteArray = null;
         var _loc3_:int = 100;
         var _loc6_:Array = param2[0];
         _loc3_ = param2[1];
         var _loc7_:BlitBoneDataOuterBindRule = param2[2];
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc13_:Vector.<BlitData> = new Vector.<BlitData>();
         _loc9_ = 0;
         for each(_loc5_ in _loc6_)
         {
            _loc5_.UpdateFrameBlitsUsingOutputScale();
            if(_loc7_ && _loc7_.CheckBindNodeBlitData(_loc5_))
            {
               delete _loc6_[_loc5_.name];
            }
            else
            {
               _loc4_ = 0;
               while(_loc4_ < _loc5_.totalFrames)
               {
                  (_loc11_ = _loc5_.GetFrame(_loc4_)).UpdateBitmapDataRemovingGap();
                  _loc12_.push(_loc11_.getBitmapData());
                  _loc9_++;
                  BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataBlitDecodePlugin_WriteEveryBlitData,[_loc5_]);
                  _loc4_++;
               }
               _loc13_.push(_loc5_);
            }
         }
         if(_loc7_)
         {
            _loc9_ += _loc7_.PushRootContainerToList(_loc12_,_loc6_,_loc13_);
         }
         var _loc14_:Vector.<Rectangle> = new Vector.<Rectangle>(_loc9_,true);
         var _loc15_:BitmapData = TextureUtil.PackTextures(_loc12_,_loc14_,1);
         _loc9_ = 0;
         for each(_loc5_ in _loc13_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_.totalFrames)
            {
               (_loc11_ = _loc5_.GetFrame(_loc4_)).SetData(_loc15_,0,_loc14_[_loc9_++]);
               _loc4_++;
            }
         }
         for each(_loc5_ in _loc6_)
         {
            _loc10_++;
         }
         _loc16_ = Vector.<BitmapData>([_loc15_]);
         BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataBlitDecodePlugin_WriteOutputBitmapData,[_loc15_]);
         param1.writeByte(255);
         param1.writeShort(_loc16_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc16_.length)
         {
            _loc8_ = _loc16_[_loc4_];
            param1.writeShort(_loc8_.width);
            param1.writeShort(_loc8_.height);
            if(_loc3_ >= 100)
            {
               param1.writeBytes(_loc8_.getPixels(new Rectangle(0,0,_loc8_.width,_loc8_.height)));
            }
            else
            {
               _loc18_ = (_loc17_ = EncoderUtil.EncoderJPEG(_loc8_,_loc3_)).length;
               _loc17_.position = 0;
               param1.writeShort(65495);
               param1.writeUnsignedInt(_loc18_);
               param1.writeBytes(_loc17_);
            }
            _loc4_++;
         }
         param1.writeShort(_loc10_);
         for each(_loc5_ in _loc6_)
         {
            _loc19_ = _loc5_.GetContentBytes(_loc3_);
            param1.writeBytes(_loc19_);
         }
      }
   }
}

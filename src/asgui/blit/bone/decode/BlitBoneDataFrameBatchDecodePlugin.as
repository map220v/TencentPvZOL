package asgui.blit.bone.decode
{
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneFrameBatch;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import flash.utils.ByteArray;
   
   public class BlitBoneDataFrameBatchDecodePlugin implements IBlitBoneDataEncodePlugin
   {
       
      
      public function BlitBoneDataFrameBatchDecodePlugin()
      {
         super();
      }
      
      public function readBytes(param1:ByteArray, param2:BlitBoneData, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc6_:BlitBoneFrameBatch = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc5_:Array = [];
         if(param3 >= 4)
         {
            _loc8_ = param1.readShort();
            while(_loc8_-- > 0)
            {
               _loc9_ = param1.readUTF();
               _loc10_ = param1.readShort();
               if(_loc5_[_loc9_] == null)
               {
                  _loc5_[_loc9_] = new Vector.<BlitBoneFrameBatch>(_loc10_,true);
               }
               _loc4_ = 0;
               while(_loc4_ < _loc10_)
               {
                  (_loc6_ = new BlitBoneFrameBatch()).loadBytes(param1,_loc5_);
                  _loc5_[_loc9_][_loc4_] = _loc6_;
                  _loc4_++;
               }
            }
         }
         var _loc7_:int = param1.readInt();
         param2.frameBatch.length = _loc7_;
         while(_loc7_-- > 0)
         {
            (_loc6_ = new BlitBoneFrameBatch()).loadBytes(param1,_loc5_);
            param2.frameBatch[param2.frameBatch.length - _loc7_ - 1] = _loc6_;
         }
      }
      
      public function writeBytes(param1:ByteArray, param2:*) : void
      {
         var _loc6_:int = 0;
         var _loc7_:BlitBoneFrameBatch = null;
         var _loc11_:* = undefined;
         var _loc3_:Array = [];
         var _loc4_:Vector.<BlitBoneFrameBatch> = param2[0];
         var _loc5_:BlitBoneDataOuterBindRule = param2[1];
         var _loc8_:int = _loc4_.length;
         if(_loc5_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc8_)
            {
               _loc5_.CheckBlitBoneFrameBatch(_loc4_[_loc6_]);
               _loc6_++;
            }
         }
         var _loc9_:ByteArray;
         (_loc9_ = new ByteArray()).writeInt(_loc4_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc4_[_loc6_].writeBytes(_loc9_,_loc3_);
            _loc6_++;
         }
         var _loc10_:int = 0;
         for(_loc11_ in _loc3_)
         {
            _loc10_++;
         }
         if(_loc10_ > 0)
         {
            param1.writeShort(_loc10_);
            for(_loc11_ in _loc3_)
            {
               _loc10_++;
               _loc8_ = _loc3_[_loc11_].length;
               param1.writeUTF(_loc11_);
               param1.writeShort(_loc8_);
               _loc6_ = 0;
               while(_loc6_ < _loc8_)
               {
                  (_loc7_ = _loc3_[_loc11_][_loc6_] as BlitBoneFrameBatch).writeBytes(param1,_loc3_);
                  _loc6_++;
               }
            }
            BlitBoneManager.impl.dispatchDebug(BlitBoneDataPluginDebug.BlitBoneDataFrameBatchDecodePlugin_WriteBatchesHolder,[_loc3_]);
         }
         else
         {
            param1.writeShort(0);
         }
         param1.writeBytes(_loc9_);
      }
   }
}

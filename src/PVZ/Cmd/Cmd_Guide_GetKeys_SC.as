package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guide_GetKeys_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guide_GetKeys_SC";
      
      public static const KEYLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guide_GetKeys_SC.keyList","keyList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guide_Key);
      
      public static const OPENID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guide_GetKeys_SC.openId","openId",2 << 3 | WireType.VARINT);
      
      public static const FINISHID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guide_GetKeys_SC.finishId","finishId",3 << 3 | WireType.VARINT);
       
      
      public var keyList:Array;
      
      public var openId:Array;
      
      public var finishId:Array;
      
      public function Cmd_Guide_GetKeys_SC()
      {
         this.keyList = [];
         this.openId = [];
         this.finishId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guide_GetKeys_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.keyList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.keyList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.openId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.openId[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.finishId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.finishId[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  this.keyList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guide_Key()));
                  break;
               case 2:
                  if((_loc3_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.openId);
                  }
                  else
                  {
                     this.openId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if((_loc3_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.finishId);
                  }
                  else
                  {
                     this.finishId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}

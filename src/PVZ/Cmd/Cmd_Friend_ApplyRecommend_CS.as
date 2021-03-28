package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Friend_ApplyRecommend_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_ApplyRecommend_CS";
      
      public static const FRIENDLIST:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Friend_ApplyRecommend_CS.friendlist","friendlist",1 << 3 | WireType.VARINT);
      
      public static const ISBROADCAST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Friend_ApplyRecommend_CS.isBroadcast","isBroadcast",2 << 3 | WireType.VARINT);
       
      
      public var friendlist:Array;
      
      private var isBroadcast$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Friend_ApplyRecommend_CS()
      {
         this.friendlist = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_ApplyRecommend_CS.$MessageID;
      }
      
      public function clearIsBroadcast() : void
      {
         this.hasField$0 &= 4294967294;
         this.isBroadcast$field = new Boolean();
      }
      
      public function get hasIsBroadcast() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isBroadcast(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.isBroadcast$field = param1;
      }
      
      public function get isBroadcast() : Boolean
      {
         return this.isBroadcast$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.friendlist.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.friendlist[_loc2_]);
            _loc2_++;
         }
         if(this.hasIsBroadcast)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isBroadcast$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.friendlist);
                  }
                  else
                  {
                     this.friendlist.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_ApplyRecommend_CS.isBroadcast cannot be set twice.");
                  }
                  _loc3_++;
                  this.isBroadcast = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}

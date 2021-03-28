package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_QQBrowser_TakeExclusiveGift_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_QQBrowser_TakeExclusiveGift_CS";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_QQBrowser_TakeExclusiveGift_CS.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const ISQQBROWSER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_QQBrowser_TakeExclusiveGift_CS.isQQBrowser","isQQBrowser",2 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isQQBrowser$field:Boolean;
      
      public function Cmd_QQBrowser_TakeExclusiveGift_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_QQBrowser_TakeExclusiveGift_CS.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearIsQQBrowser() : void
      {
         this.hasField$0 &= 4294967293;
         this.isQQBrowser$field = new Boolean();
      }
      
      public function get hasIsQQBrowser() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isQQBrowser(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isQQBrowser$field = param1;
      }
      
      public function get isQQBrowser() : Boolean
      {
         return this.isQQBrowser$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasIsQQBrowser)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isQQBrowser$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_QQBrowser_TakeExclusiveGift_CS.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_QQBrowser_TakeExclusiveGift_CS.isQQBrowser cannot be set twice.");
                  }
                  _loc4_++;
                  this.isQQBrowser = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

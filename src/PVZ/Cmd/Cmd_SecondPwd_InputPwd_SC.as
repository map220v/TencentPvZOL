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
   
   public final class Cmd_SecondPwd_InputPwd_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SecondPwd_InputPwd_SC";
      
      public static const RIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_InputPwd_SC.right","right",1 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SecondPwd_InputPwd_SC.times","times",2 << 3 | WireType.VARINT);
      
      public static const PWDTAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SecondPwd_InputPwd_SC.pwdtag","pwdtag",3 << 3 | WireType.VARINT);
       
      
      private var right$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var times$field:uint;
      
      private var pwdtag$field:uint;
      
      public function Cmd_SecondPwd_InputPwd_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SecondPwd_InputPwd_SC.$MessageID;
      }
      
      public function clearRight() : void
      {
         this.hasField$0 &= 4294967294;
         this.right$field = new Boolean();
      }
      
      public function get hasRight() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set right(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.right$field = param1;
      }
      
      public function get right() : Boolean
      {
         return this.right$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearPwdtag() : void
      {
         this.hasField$0 &= 4294967291;
         this.pwdtag$field = new uint();
      }
      
      public function get hasPwdtag() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set pwdtag(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.pwdtag$field = param1;
      }
      
      public function get pwdtag() : uint
      {
         return this.pwdtag$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.right$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasPwdtag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.pwdtag$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_InputPwd_SC.right cannot be set twice.");
                  }
                  _loc3_++;
                  this.right = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_InputPwd_SC.times cannot be set twice.");
                  }
                  _loc4_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_InputPwd_SC.pwdtag cannot be set twice.");
                  }
                  _loc5_++;
                  this.pwdtag = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

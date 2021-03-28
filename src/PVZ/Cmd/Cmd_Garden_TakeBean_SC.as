package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Garden_TakeBean_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Garden_TakeBean_SC";
      
      public static const BEANNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_TakeBean_SC.beannum","beannum",1 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_TakeBean_SC.exp","exp",2 << 3 | WireType.VARINT);
       
      
      private var beannum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      public function Cmd_Garden_TakeBean_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Garden_TakeBean_SC.$MessageID;
      }
      
      public function clearBeannum() : void
      {
         this.hasField$0 &= 4294967294;
         this.beannum$field = new uint();
      }
      
      public function get hasBeannum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set beannum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.beannum$field = param1;
      }
      
      public function get beannum() : uint
      {
         return this.beannum$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBeannum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.beannum$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
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
                     throw new IOError("Bad data format: Cmd_Garden_TakeBean_SC.beannum cannot be set twice.");
                  }
                  _loc3_++;
                  this.beannum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_TakeBean_SC.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

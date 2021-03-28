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
   
   public final class Cmd_Guild_SetQuickJoin_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guild_SetQuickJoin_CS";
      
      public static const ALLOWQUICKJOIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guild_SetQuickJoin_CS.allowQuickJoin","allowQuickJoin",1 << 3 | WireType.VARINT);
      
      public static const NEEDPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guild_SetQuickJoin_CS.needPower","needPower",2 << 3 | WireType.VARINT);
       
      
      private var allowQuickJoin$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var needPower$field:uint;
      
      public function Cmd_Guild_SetQuickJoin_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guild_SetQuickJoin_CS.$MessageID;
      }
      
      public function clearAllowQuickJoin() : void
      {
         this.hasField$0 &= 4294967294;
         this.allowQuickJoin$field = new Boolean();
      }
      
      public function get hasAllowQuickJoin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set allowQuickJoin(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.allowQuickJoin$field = param1;
      }
      
      public function get allowQuickJoin() : Boolean
      {
         return this.allowQuickJoin$field;
      }
      
      public function clearNeedPower() : void
      {
         this.hasField$0 &= 4294967293;
         this.needPower$field = new uint();
      }
      
      public function get hasNeedPower() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set needPower(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.needPower$field = param1;
      }
      
      public function get needPower() : uint
      {
         return this.needPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAllowQuickJoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.allowQuickJoin$field);
         }
         if(this.hasNeedPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.needPower$field);
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
                     throw new IOError("Bad data format: Cmd_Guild_SetQuickJoin_CS.allowQuickJoin cannot be set twice.");
                  }
                  _loc3_++;
                  this.allowQuickJoin = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guild_SetQuickJoin_CS.needPower cannot be set twice.");
                  }
                  _loc4_++;
                  this.needPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

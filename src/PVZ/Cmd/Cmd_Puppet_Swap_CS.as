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
   
   public final class Cmd_Puppet_Swap_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Puppet_Swap_CS";
      
      public static const SRCBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_Swap_CS.srcBaseId","srcBaseId",1 << 3 | WireType.VARINT);
      
      public static const DSTBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_Swap_CS.dstBaseId","dstBaseId",2 << 3 | WireType.VARINT);
       
      
      private var srcBaseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dstBaseId$field:uint;
      
      public function Cmd_Puppet_Swap_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Puppet_Swap_CS.$MessageID;
      }
      
      public function clearSrcBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.srcBaseId$field = new uint();
      }
      
      public function get hasSrcBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set srcBaseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.srcBaseId$field = param1;
      }
      
      public function get srcBaseId() : uint
      {
         return this.srcBaseId$field;
      }
      
      public function clearDstBaseId() : void
      {
         this.hasField$0 &= 4294967293;
         this.dstBaseId$field = new uint();
      }
      
      public function get hasDstBaseId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dstBaseId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dstBaseId$field = param1;
      }
      
      public function get dstBaseId() : uint
      {
         return this.dstBaseId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSrcBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.srcBaseId$field);
         }
         if(this.hasDstBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dstBaseId$field);
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
                     throw new IOError("Bad data format: Cmd_Puppet_Swap_CS.srcBaseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.srcBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_Swap_CS.dstBaseId cannot be set twice.");
                  }
                  _loc4_++;
                  this.dstBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}

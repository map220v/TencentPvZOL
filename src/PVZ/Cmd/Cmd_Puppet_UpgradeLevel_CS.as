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
   
   public final class Cmd_Puppet_UpgradeLevel_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Puppet_UpgradeLevel_CS";
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeLevel_CS.baseId","baseId",1 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeLevel_CS.itemId","itemId",2 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_UpgradeLevel_CS.num","num",3 << 3 | WireType.VARINT);
       
      
      private var baseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemId$field:uint;
      
      private var num$field:uint;
      
      public function Cmd_Puppet_UpgradeLevel_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Puppet_UpgradeLevel_CS.$MessageID;
      }
      
      public function clearBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.baseId$field = new uint();
      }
      
      public function get hasBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set baseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.baseId$field = param1;
      }
      
      public function get baseId() : uint
      {
         return this.baseId$field;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967293;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.baseId$field);
         }
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
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
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeLevel_CS.baseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeLevel_CS.itemId cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_UpgradeLevel_CS.num cannot be set twice.");
                  }
                  _loc5_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

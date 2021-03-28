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
   
   public final class Cmd_Puppet_Extract_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Puppet_Extract_CS";
      
      public static const GROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_Extract_CS.groupId","groupId",1 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Puppet_Extract_CS.count","count",2 << 3 | WireType.VARINT);
      
      public static const USEITEM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Puppet_Extract_CS.useItem","useItem",3 << 3 | WireType.VARINT);
       
      
      private var groupId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var useItem$field:Boolean;
      
      public function Cmd_Puppet_Extract_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Puppet_Extract_CS.$MessageID;
      }
      
      public function clearGroupId() : void
      {
         this.hasField$0 &= 4294967294;
         this.groupId$field = new uint();
      }
      
      public function get hasGroupId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set groupId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.groupId$field = param1;
      }
      
      public function get groupId() : uint
      {
         return this.groupId$field;
      }
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      public function clearUseItem() : void
      {
         this.hasField$0 &= 4294967291;
         this.useItem$field = new Boolean();
      }
      
      public function get hasUseItem() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set useItem(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.useItem$field = param1;
      }
      
      public function get useItem() : Boolean
      {
         return this.useItem$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGroupId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.groupId$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasUseItem)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.useItem$field);
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
                     throw new IOError("Bad data format: Cmd_Puppet_Extract_CS.groupId cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_Extract_CS.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Puppet_Extract_CS.useItem cannot be set twice.");
                  }
                  _loc5_++;
                  this.useItem = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

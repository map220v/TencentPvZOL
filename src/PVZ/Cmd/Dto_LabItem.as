package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_LabItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_LabItem";
      
      public static const LABID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_LabItem.labId","labId",1 << 3 | WireType.VARINT);
      
      public static const LABLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_LabItem.labLevel","labLevel",2 << 3 | WireType.VARINT);
      
      public static const LABSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_LabItem.labStatus","labStatus",3 << 3 | WireType.VARINT,E_LabStatus);
       
      
      private var labId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var labLevel$field:uint;
      
      private var labStatus$field:int;
      
      public function Dto_LabItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_LabItem.$MessageID;
      }
      
      public function clearLabId() : void
      {
         this.hasField$0 &= 4294967294;
         this.labId$field = new uint();
      }
      
      public function get hasLabId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set labId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.labId$field = param1;
      }
      
      public function get labId() : uint
      {
         return this.labId$field;
      }
      
      public function clearLabLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.labLevel$field = new uint();
      }
      
      public function get hasLabLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set labLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.labLevel$field = param1;
      }
      
      public function get labLevel() : uint
      {
         return this.labLevel$field;
      }
      
      public function clearLabStatus() : void
      {
         this.hasField$0 &= 4294967291;
         this.labStatus$field = new int();
      }
      
      public function get hasLabStatus() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set labStatus(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.labStatus$field = param1;
      }
      
      public function get labStatus() : int
      {
         return this.labStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLabId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.labId$field);
         }
         if(this.hasLabLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.labLevel$field);
         }
         if(this.hasLabStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.labStatus$field);
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
                     throw new IOError("Bad data format: Dto_LabItem.labId cannot be set twice.");
                  }
                  _loc3_++;
                  this.labId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_LabItem.labLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.labLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_LabItem.labStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.labStatus = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

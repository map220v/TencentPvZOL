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
   
   public final class Dto_Buff_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Buff_Info";
      
      public static const BUFFID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Buff_Info.buffId","buffId",1 << 3 | WireType.VARINT);
      
      public static const BUFFTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Buff_Info.buffType","buffType",2 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Buff_Info.endTime","endTime",3 << 3 | WireType.VARINT);
       
      
      private var buffId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var buffType$field:uint;
      
      private var endTime$field:uint;
      
      public function Dto_Buff_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Buff_Info.$MessageID;
      }
      
      public function clearBuffId() : void
      {
         this.hasField$0 &= 4294967294;
         this.buffId$field = new uint();
      }
      
      public function get hasBuffId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set buffId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.buffId$field = param1;
      }
      
      public function get buffId() : uint
      {
         return this.buffId$field;
      }
      
      public function clearBuffType() : void
      {
         this.hasField$0 &= 4294967293;
         this.buffType$field = new uint();
      }
      
      public function get hasBuffType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set buffType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.buffType$field = param1;
      }
      
      public function get buffType() : uint
      {
         return this.buffType$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBuffId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.buffId$field);
         }
         if(this.hasBuffType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.buffType$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
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
                     throw new IOError("Bad data format: Dto_Buff_Info.buffId cannot be set twice.");
                  }
                  _loc3_++;
                  this.buffId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Buff_Info.buffType cannot be set twice.");
                  }
                  _loc4_++;
                  this.buffType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Buff_Info.endTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

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
   
   public final class Cmd_Welfare_Take_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Welfare_Take_CS";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Welfare_Take_CS.type","type",1 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Welfare_Take_CS.level","level",2 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Welfare_Take_CS.power","power",3 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var power$field:uint;
      
      public function Cmd_Welfare_Take_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Welfare_Take_CS.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
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
                     throw new IOError("Bad data format: Cmd_Welfare_Take_CS.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Welfare_Take_CS.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Welfare_Take_CS.power cannot be set twice.");
                  }
                  _loc5_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

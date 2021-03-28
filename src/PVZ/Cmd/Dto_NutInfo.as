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
   
   public final class Dto_NutInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_NutInfo";
      
      public static const NUTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NutInfo.nutId","nutId",1 << 3 | WireType.VARINT);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NutInfo.position","position",2 << 3 | WireType.VARINT);
      
      public static const TICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NutInfo.ticket","ticket",3 << 3 | WireType.VARINT);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NutInfo.weight","weight",4 << 3 | WireType.VARINT);
      
      public static const DEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_NutInfo.dead","dead",5 << 3 | WireType.VARINT);
       
      
      private var nutId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var position$field:uint;
      
      private var ticket$field:uint;
      
      private var weight$field:uint;
      
      private var dead$field:Boolean;
      
      public function Dto_NutInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_NutInfo.$MessageID;
      }
      
      public function clearNutId() : void
      {
         this.hasField$0 &= 4294967294;
         this.nutId$field = new uint();
      }
      
      public function get hasNutId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set nutId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.nutId$field = param1;
      }
      
      public function get nutId() : uint
      {
         return this.nutId$field;
      }
      
      public function clearPosition() : void
      {
         this.hasField$0 &= 4294967293;
         this.position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.position$field = param1;
      }
      
      public function get position() : uint
      {
         return this.position$field;
      }
      
      public function clearTicket() : void
      {
         this.hasField$0 &= 4294967291;
         this.ticket$field = new uint();
      }
      
      public function get hasTicket() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ticket(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ticket$field = param1;
      }
      
      public function get ticket() : uint
      {
         return this.ticket$field;
      }
      
      public function clearWeight() : void
      {
         this.hasField$0 &= 4294967287;
         this.weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return this.weight$field;
      }
      
      public function clearDead() : void
      {
         this.hasField$0 &= 4294967279;
         this.dead$field = new Boolean();
      }
      
      public function get hasDead() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set dead(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.dead$field = param1;
      }
      
      public function get dead() : Boolean
      {
         return this.dead$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNutId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.nutId$field);
         }
         if(this.hasPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.position$field);
         }
         if(this.hasTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.ticket$field);
         }
         if(this.hasWeight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.weight$field);
         }
         if(this.hasDead)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.dead$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NutInfo.nutId cannot be set twice.");
                  }
                  _loc3_++;
                  this.nutId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NutInfo.position cannot be set twice.");
                  }
                  _loc4_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NutInfo.ticket cannot be set twice.");
                  }
                  _loc5_++;
                  this.ticket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NutInfo.weight cannot be set twice.");
                  }
                  _loc6_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NutInfo.dead cannot be set twice.");
                  }
                  _loc7_++;
                  this.dead = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}

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
   
   public final class Dto_HalloweenPumpkinData extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_HalloweenPumpkinData";
      
      public static const DAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HalloweenPumpkinData.damage","damage",1 << 3 | WireType.VARINT);
      
      public static const DEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_HalloweenPumpkinData.dead","dead",2 << 3 | WireType.VARINT);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_HalloweenPumpkinData.hasTakeReward","hasTakeReward",3 << 3 | WireType.VARINT);
       
      
      private var damage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dead$field:Boolean;
      
      private var hasTakeReward$field:Boolean;
      
      public function Dto_HalloweenPumpkinData()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_HalloweenPumpkinData.$MessageID;
      }
      
      public function clearDamage() : void
      {
         this.hasField$0 &= 4294967294;
         this.damage$field = new uint();
      }
      
      public function get hasDamage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set damage(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.damage$field = param1;
      }
      
      public function get damage() : uint
      {
         return this.damage$field;
      }
      
      public function clearDead() : void
      {
         this.hasField$0 &= 4294967293;
         this.dead$field = new Boolean();
      }
      
      public function get hasDead() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dead(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.dead$field = param1;
      }
      
      public function get dead() : Boolean
      {
         return this.dead$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasDamage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.damage$field);
         }
         if(this.hasDead)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.dead$field);
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
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
                     throw new IOError("Bad data format: Dto_HalloweenPumpkinData.damage cannot be set twice.");
                  }
                  _loc3_++;
                  this.damage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_HalloweenPumpkinData.dead cannot be set twice.");
                  }
                  _loc4_++;
                  this.dead = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_HalloweenPumpkinData.hasTakeReward cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

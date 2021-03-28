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
   
   public final class Cmd_Halloween_HitPumpkin_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Halloween_HitPumpkin_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_HitPumpkin_SC.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const INDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_HitPumpkin_SC.index","index",2 << 3 | WireType.VARINT);
      
      public static const PUMPKINDAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_HitPumpkin_SC.pumpkinDamage","pumpkinDamage",3 << 3 | WireType.VARINT);
      
      public static const HITDAMAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_HitPumpkin_SC.hitDamage","hitDamage",4 << 3 | WireType.VARINT);
       
      
      private var activityid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var index$field:uint;
      
      private var pumpkinDamage$field:uint;
      
      private var hitDamage$field:uint;
      
      public function Cmd_Halloween_HitPumpkin_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Halloween_HitPumpkin_SC.$MessageID;
      }
      
      public function clearActivityid() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityid$field = new uint();
      }
      
      public function get hasActivityid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityid$field = param1;
      }
      
      public function get activityid() : uint
      {
         return this.activityid$field;
      }
      
      public function clearIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.index$field = new uint();
      }
      
      public function get hasIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set index(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.index$field = param1;
      }
      
      public function get index() : uint
      {
         return this.index$field;
      }
      
      public function clearPumpkinDamage() : void
      {
         this.hasField$0 &= 4294967291;
         this.pumpkinDamage$field = new uint();
      }
      
      public function get hasPumpkinDamage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set pumpkinDamage(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.pumpkinDamage$field = param1;
      }
      
      public function get pumpkinDamage() : uint
      {
         return this.pumpkinDamage$field;
      }
      
      public function clearHitDamage() : void
      {
         this.hasField$0 &= 4294967287;
         this.hitDamage$field = new uint();
      }
      
      public function get hasHitDamage() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set hitDamage(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.hitDamage$field = param1;
      }
      
      public function get hitDamage() : uint
      {
         return this.hitDamage$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityid$field);
         }
         if(this.hasIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.index$field);
         }
         if(this.hasPumpkinDamage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.pumpkinDamage$field);
         }
         if(this.hasHitDamage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.hitDamage$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Halloween_HitPumpkin_SC.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Halloween_HitPumpkin_SC.index cannot be set twice.");
                  }
                  _loc4_++;
                  this.index = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Halloween_HitPumpkin_SC.pumpkinDamage cannot be set twice.");
                  }
                  _loc5_++;
                  this.pumpkinDamage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Halloween_HitPumpkin_SC.hitDamage cannot be set twice.");
                  }
                  _loc6_++;
                  this.hitDamage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}

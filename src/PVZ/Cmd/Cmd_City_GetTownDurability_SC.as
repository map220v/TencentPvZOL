package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_City_GetTownDurability_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_City_GetTownDurability_SC";
      
      public static const TOWNDURABILITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_City_GetTownDurability_SC.townDurability","townDurability",1 << 3 | WireType.VARINT);
      
      public static const TOWNDURABILITYMAX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_City_GetTownDurability_SC.townDurabilityMax","townDurabilityMax",2 << 3 | WireType.VARINT);
      
      public static const LEFTREBUILDCOOLDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_City_GetTownDurability_SC.leftRebuildCoolDown","leftRebuildCoolDown",3 << 3 | WireType.VARINT);
       
      
      private var townDurability$field:int;
      
      private var hasField$0:uint = 0;
      
      private var townDurabilityMax$field:int;
      
      private var leftRebuildCoolDown$field:uint;
      
      public function Cmd_City_GetTownDurability_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_City_GetTownDurability_SC.$MessageID;
      }
      
      public function clearTownDurability() : void
      {
         this.hasField$0 &= 4294967294;
         this.townDurability$field = new int();
      }
      
      public function get hasTownDurability() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set townDurability(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.townDurability$field = param1;
      }
      
      public function get townDurability() : int
      {
         return this.townDurability$field;
      }
      
      public function clearTownDurabilityMax() : void
      {
         this.hasField$0 &= 4294967293;
         this.townDurabilityMax$field = new int();
      }
      
      public function get hasTownDurabilityMax() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set townDurabilityMax(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.townDurabilityMax$field = param1;
      }
      
      public function get townDurabilityMax() : int
      {
         return this.townDurabilityMax$field;
      }
      
      public function clearLeftRebuildCoolDown() : void
      {
         this.hasField$0 &= 4294967291;
         this.leftRebuildCoolDown$field = new uint();
      }
      
      public function get hasLeftRebuildCoolDown() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set leftRebuildCoolDown(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.leftRebuildCoolDown$field = param1;
      }
      
      public function get leftRebuildCoolDown() : uint
      {
         return this.leftRebuildCoolDown$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTownDurability)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.townDurability$field);
         }
         if(this.hasTownDurabilityMax)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.townDurabilityMax$field);
         }
         if(this.hasLeftRebuildCoolDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.leftRebuildCoolDown$field);
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
                     throw new IOError("Bad data format: Cmd_City_GetTownDurability_SC.townDurability cannot be set twice.");
                  }
                  _loc3_++;
                  this.townDurability = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_GetTownDurability_SC.townDurabilityMax cannot be set twice.");
                  }
                  _loc4_++;
                  this.townDurabilityMax = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_City_GetTownDurability_SC.leftRebuildCoolDown cannot be set twice.");
                  }
                  _loc5_++;
                  this.leftRebuildCoolDown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}

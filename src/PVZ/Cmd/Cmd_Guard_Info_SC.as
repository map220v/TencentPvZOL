package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guard_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_Info_SC";
      
      public static const GUARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_Info_SC.guard","guard",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guard);
      
      public static const FORMATION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_Info_SC.formation","formation",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
      
      public static const HASINVITE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Info_SC.hasInvite","hasInvite",3 << 3 | WireType.VARINT);
      
      public static const HASDEFENCE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Info_SC.hasDefence","hasDefence",4 << 3 | WireType.VARINT);
      
      public static const HASROB:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Info_SC.hasRob","hasRob",5 << 3 | WireType.VARINT);
      
      public static const REFRESHCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guard_Info_SC.refreshCount","refreshCount",6 << 3 | WireType.VARINT);
      
      public static const BUYLIGHTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guard_Info_SC.buyLightCount","buyLightCount",7 << 3 | WireType.VARINT);
       
      
      public var guard:Array;
      
      public var formation:Array;
      
      private var hasInvite$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var hasDefence$field:Boolean;
      
      private var hasRob$field:Boolean;
      
      private var refreshCount$field:uint;
      
      private var buyLightCount$field:uint;
      
      public function Cmd_Guard_Info_SC()
      {
         this.guard = [];
         this.formation = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_Info_SC.$MessageID;
      }
      
      public function clearHasInvite() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasInvite$field = new Boolean();
      }
      
      public function get hasHasInvite() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasInvite(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasInvite$field = param1;
      }
      
      public function get hasInvite() : Boolean
      {
         return this.hasInvite$field;
      }
      
      public function clearHasDefence() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasDefence$field = new Boolean();
      }
      
      public function get hasHasDefence() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasDefence(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasDefence$field = param1;
      }
      
      public function get hasDefence() : Boolean
      {
         return this.hasDefence$field;
      }
      
      public function clearHasRob() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasRob$field = new Boolean();
      }
      
      public function get hasHasRob() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasRob(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasRob$field = param1;
      }
      
      public function get hasRob() : Boolean
      {
         return this.hasRob$field;
      }
      
      public function clearRefreshCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.refreshCount$field = new uint();
      }
      
      public function get hasRefreshCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set refreshCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.refreshCount$field = param1;
      }
      
      public function get refreshCount() : uint
      {
         return this.refreshCount$field;
      }
      
      public function clearBuyLightCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.buyLightCount$field = new uint();
      }
      
      public function get hasBuyLightCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set buyLightCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.buyLightCount$field = param1;
      }
      
      public function get buyLightCount() : uint
      {
         return this.buyLightCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.guard.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guard[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.formation.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation[_loc3_]);
            _loc3_++;
         }
         if(this.hasHasInvite)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasInvite$field);
         }
         if(this.hasHasDefence)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.hasDefence$field);
         }
         if(this.hasHasRob)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hasRob$field);
         }
         if(this.hasRefreshCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshCount$field);
         }
         if(this.hasBuyLightCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.buyLightCount$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  this.guard.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guard()));
                  break;
               case 2:
                  this.formation.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FormationInfo()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Info_SC.hasInvite cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasInvite = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Info_SC.hasDefence cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasDefence = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Info_SC.hasRob cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasRob = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Info_SC.refreshCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.refreshCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Info_SC.buyLightCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.buyLightCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}

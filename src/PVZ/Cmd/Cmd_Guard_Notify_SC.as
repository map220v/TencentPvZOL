package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guard_Notify_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_Notify_SC";
      
      public static const HASINVITE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Notify_SC.hasInvite","hasInvite",1 << 3 | WireType.VARINT);
      
      public static const HASDEFENCE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Notify_SC.hasDefence","hasDefence",2 << 3 | WireType.VARINT);
      
      public static const HASROB:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_Notify_SC.hasRob","hasRob",3 << 3 | WireType.VARINT);
       
      
      private var hasInvite$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var hasDefence$field:Boolean;
      
      private var hasRob$field:Boolean;
      
      public function Cmd_Guard_Notify_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_Notify_SC.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHasInvite)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.hasInvite$field);
         }
         if(this.hasHasDefence)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasDefence$field);
         }
         if(this.hasHasRob)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasRob$field);
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
                     throw new IOError("Bad data format: Cmd_Guard_Notify_SC.hasInvite cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasInvite = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Notify_SC.hasDefence cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasDefence = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_Notify_SC.hasRob cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasRob = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
